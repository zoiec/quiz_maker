class OutcomesController < ApplicationController

  def new
    @quiz = Quiz.friendly.find(params[:quiz_id])
    @outcome = Outcome.new(quiz: @quiz)
  end

  def create
    @quiz = Quiz.friendly.find(params[:quiz_id])
    @outcome = Outcome.create(outcome_params)
    if(@outcome.save)
      redirect_to edit_quiz_path(@outcome.quiz)
    else
      render :new
    end
  end

  def edit
    @outcome = Outcome.find(params[:id])
  end

  def update
    @outcome = Outcome.find(params[:id])
    @quiz = @outcome.quiz
    if(@outcome.update_attributes(outcome_params))
      redirect_to edit_quiz_path(@outcome.quiz)
    else
      render :edit
    end
  end

  private

  def outcome_params
    params.require(:outcome).permit(:body, :name, :picture).merge(quiz: @quiz) 
  end

end
