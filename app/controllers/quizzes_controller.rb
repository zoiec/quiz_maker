class QuizzesController < ApplicationController
  before_action :require_login, except: [:show]

  def new
    authorize :quiz
    @quiz = Quiz.new
  end

  def create
    authorize :quiz
    @quiz = Quiz.new(quiz_params)
    if @quiz.save
      redirect_to edit_quiz_path(@quiz)
    else
      render :new, status: 422
    end
  end

  def index
    authorize :quiz
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
    @quiz = Quiz.includes(:outcomes, questions: { choices: :weights }).friendly.find(params[:id])
    @new_question = Question.new(quiz: @quiz)
    authorize @quiz
  end
  private

  def quiz_params
    params.require(:quiz).permit(:slug, :title, :intro_content)
  end

end
