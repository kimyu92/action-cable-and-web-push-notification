module ApplicationCable
  class AnswersChannel < Channel
    def subscribed
      stream_from 'answers'
    end
  end
end
