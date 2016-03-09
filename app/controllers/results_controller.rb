class ResultsController < ApplicationController

  def show
    @quiz = Quiz.friendly.find(params[:quiz_id])
    #if we have a result already and it doesn't need to be recomputed
    previous_result = result_for_quiz(@quiz)
    if(!previous_result.nil? && !previous_result.needs_recomputation?)
      @result = previous_result
      @recomputed = false
    else
      @result = @quiz.compute_result(current_user)
      @recomputed = true
    end
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
