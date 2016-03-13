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
  end

  def edit
    @quiz = Quiz.includes(:outcomes, questions: { choices: :weights }).friendly.find(params[:id])
    @question = Question.new(quiz: @quiz)
    authorize @quiz
  end

  def update
    @quiz = Quiz.friendly.find(params[:id])
    authorize @quiz
    if(@quiz.update_attributes(quiz_params))
      redirect_to edit_quiz_path @quiz
    else
      render :edit
    end
  end

  def destroy
    @quiz = Quiz.friendly.find(params[:id])
    authorize @quiz
    @quiz.destroy
    flash[:notice] = "Quiz destroyed successfully"
    redirect_to quizzes_path
  end

  def copy
    @quiz = Quiz.friendly.find(params[:quiz_id])
    authorize @quiz
    QuizCopier.copy(@quiz)
    redirect_to quizzes_path
  end

  private

  def quiz_params
    params.require(:quiz).permit(:slug, :title, :intro_content)
  end

end
