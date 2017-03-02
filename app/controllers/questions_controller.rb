class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def show
    @question = Question.includes(:answers).find(params[:id])
    @answer = @question.answers.new
  end
end
