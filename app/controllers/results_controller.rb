class ResultsController < ApplicationController

  def show
    @quiz = Quiz.find(params[:quiz_id])
    @result = result_for_quiz_and_user(@quiz, current_user)  || @quiz.compute_result(current_user)
    @outcome = @result.outcome
  end

  private

  def result_for_quiz_and_user(quiz, user)
    Result.includes(:outcome).where(user: current_user, outcomes: { quiz_id: @quiz.id }).references(:outcomes).limit(1).first
  end
end
