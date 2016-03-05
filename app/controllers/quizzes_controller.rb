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
    @quiz = Quiz.friendly.find(params[:id])
    has_completed = !Result.where(outcome: @quiz.outcomes, user: current_user).empty?
    if(has_completed)
      flash[:alert] = "Just FYI: You have already completed this quiz, so your result won't change"
    end
  end

  def edit
    @quiz = Quiz.includes(:outcomes, questions: { choices: :weights }).find(params[:id])
  end
  private

  def quiz_params
    params.require(:quiz).permit(:url, :title, :intro_content)
  end

end
