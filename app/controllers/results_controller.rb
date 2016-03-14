class ResultsController < ApplicationController

  def show
    @quiz = Quiz.friendly.find(params[:quiz_id])
    require_user_account
    previous_result = result_for_quiz(@quiz)
    if(previous_result.nil? || previous_result.needs_recomputation?)
      @result = @quiz.compute_result(current_user)
    else
      @result = previous_result
    end
    @outcome = @result.outcome
  end

  private

  def require_user_account
    if(current_user.guest?)
      flash[:notice] = "You must create an account to view your results"
      redirect_to new_guest_signup_path(after: quiz_result_path(@quiz))
    end
  end

  def result_for_quiz(quiz)
    Result.includes(:outcome).where(user: current_user, outcomes: { quiz_id: @quiz.id }).references(:outcomes).limit(1).first
  end
end
