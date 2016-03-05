class ResultsController < ApplicationController

  def show
    @quiz = Quiz.friendly.find(params[:quiz_id])
    #this is wrong. Handling later
    @result = result_for_quiz(@quiz) || @quiz.compute_result(current_user)
    @outcome = @result.outcome
  end

  def create
    @quiz = Quiz.friendly.find(params[:quiz_id])
    @result = @quiz.compute_result(current_user)
    @outcome = @result.outcome
  end

  private

  def result_for_quiz(quiz)
    Result.includes(:outcome).where(user: current_user, outcomes: { quiz_id: @quiz.id }).references(:outcomes).limit(1).first
  end
end
