class QuestionsController < ApplicationController

  def new
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.new
  end

  def create
    @quiz = Quiz.find(params[:quiz_id])
    @question = Question.new(question_params)
    if @question.save
     redirect_to edit_quiz_path(@quiz) 
    else
      render :new
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  private

  def question_params
    params.require(:question).permit(:body).merge(quiz: @quiz)
  end
end
