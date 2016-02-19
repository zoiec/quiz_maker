class QuizzesController < ApplicationController

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.create(quiz_params)
    if @quiz.save
      flash[:notice] = "Quiz created"
      render :edit, status: 201
    else
      render :new, status: 422
    end
  end

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  def edit
    @quiz = Quiz.find(params[:id])
  end
  private

  def quiz_params
    params.require(:quiz).permit(:url, :title, :intro_content)
  end

end
