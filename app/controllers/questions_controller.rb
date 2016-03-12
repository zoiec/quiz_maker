class QuestionsController < ApplicationController

  def new
    @quiz = Quiz.friendly.find(params[:quiz_id])
    @question = Question.new
  end

  def create
    @quiz = Quiz.friendly.find(params[:quiz_id])
    @question = Question.new(question_params)
    if @question.save
     redirect_to edit_quiz_path(@quiz) 
    else
      render :new
    end
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    @quiz = @question.quiz
    if(@question.update_attributes(question_params))
      redirect_to edit_question_path(@question)
    else
      render :edit
    end
  end

  private

  def question_params
    params.require(:question).permit(:body, :picture).merge(quiz: @quiz)
  end
end
