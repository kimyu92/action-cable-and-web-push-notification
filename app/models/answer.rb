class Answer < ApplicationRecord
  include Rails.application.routes.url_helpers

  belongs_to :question

  validates :content, :question, presence: true

  after_create :send_broadcast
  after_create :push_notification

  private

  def send_broadcast
    ActionCable.server.broadcast "answers_#{question.id}", id: id, content: content
  end

  def push_notification
    message = {
      title: 'New answer',
      body: "New answer for question #{question.content}. CLick to view it.",
      icon: 'https://nimbl3.com/assets/image/favicon.ico?1399950378',
      open_url: question_path(question)
    }

    subscriptions = Subscription.all

    subscriptions.each do |subscription|
      Webpush.payload_send(
        endpoint: subscription.endpoint,
        message: JSON.generate(message),
        p256dh: subscription.key_p256dh,
        auth: subscription.key_auth,
        api_key: ENV.fetch('FIRE_BASE_API_KEY')
      )
    end
  end
end
