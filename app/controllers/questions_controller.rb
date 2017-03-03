class QuestionsController < ApplicationController
  before_action :set_resource, only: [:show, :edit, :destroy, :update]

  def index
    @questions = Question.all
  end

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(permitted_attributes)

    if @question.save
      redirect_to questions_path, notice: 'Question was successfully created'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @question.assign_attributes(permitted_attributes)

    if @question.save
      redirect_to questions_path, notice: 'Question was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    if @question.destroy
      redirect_to questions_path, notice: 'Question was successfully deleted'
    else
      redirect_to questions_path, alert: 'Error when destroy question'
    end
  end

  private

  def set_resource
    @question = Question.includes(:answers).find(params[:id])
  end

  def permitted_attributes
    params.require(:question).permit(:content)
  end
end
