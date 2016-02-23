class AnswersController < ApplicationController

  def edit
    @answer = Answer.find(params[:id])
  end

  def new
    @question= Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @answer = Answer.create(answer_params)
    if @answer.save
      redirect_to edit_question_path @question
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:body).merge(question: @question)
  end

end
