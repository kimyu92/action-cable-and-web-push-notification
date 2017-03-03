class AnswersController < ApplicationController
  API_KEY = 'AAAAyXAL1fY:APA91bFQl0V1o3qR5Fk7W_jnJBDkMcHkW_2DJ0cxXVKpeDGtqQ1BO_4olRzowpUNEcmxh4hyOlRUgluN-XPpZumH5_MPLajBz2FHWGmuA2LWVLeZGPNYvVA20lcmBfdTOd9rZ14wBcmp'

  def create
    answer = Answer.new(permitted_attributes)
    answer.save!

    redirect_to question_path(answer.question)
  end

  private

  def permitted_attributes
    params
      .require(:answer)
      .permit(:content, :question_id)
  end

  def webpush
    subscription = Subscription.first
    message = {
      title: 'New answer',
      body: 'New answer for question',
      icon: 'https://nimbl3.com/assets/image/favicon.ico?1399950378',
      open_url: 'http://localhost:3000/questions'
    }
    Webpush.payload_send(
      endpoint: subscription.endpoint,
      message: JSON.generate(message),
      p256dh: subscription.key_p256dh,
      auth: subscription.key_auth,
      api_key: API_KEY
    )
  end
end
