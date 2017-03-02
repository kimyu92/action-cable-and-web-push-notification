module ApplicationCable
  class QuestionsChannel < Channel
    def subscribed
      stream_from "questions_#{params[:question_id]}"
    end
  end
end
