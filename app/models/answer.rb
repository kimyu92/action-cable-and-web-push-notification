class Answer < ApplicationRecord
  belongs_to :question

  validates :content, :question, presence: true

  after_create :send_broadcast

  private

  def send_broadcast
    ActionCable.server.broadcast "answers_#{question.id}", id: id, content: content
  end
end
