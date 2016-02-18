class QuizzesController < ApplicationController

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.create(quiz_params)
    if @quiz.save
      flash[:notice] = "Quiz created"
      redirect_to quizzes_path
    else
      render :new
    end
  end

  def index
    @quizzes = Quiz.all
  end

  def show
    @quiz = Quiz.find(params[:id])
  end

  private

  def quiz_params
    params.require(:quiz).permit(:url, :title, :intro_content)
  end

end
