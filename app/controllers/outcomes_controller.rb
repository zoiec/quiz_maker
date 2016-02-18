class OutcomesController < ApplicationController

  def new
    @quiz = Quiz.find(params[:quiz_id])
    @outcome = Outcome.new(quiz: @quiz)
  end

  def create
    @outcome = Outcome.create(outcome_params)
    if(@outcome.save)
      redirect_to @outcome.quiz
    else
      render :new
    end
  end

  private

  def outcome_params
    params.require(:outcome).permit(:body).merge(quiz_id: params[:quiz_id])
  end

end
