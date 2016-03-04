class QuizzesController < ApplicationController
  before_action :require_login, except: [:show]

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
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
    @quiz = Quiz.includes(:outcomes, questions: { choices: :weights }).find(params[:id])
  end
  private

  def quiz_params
    params.require(:quiz).permit(:url, :title, :intro_content)
  end

end
