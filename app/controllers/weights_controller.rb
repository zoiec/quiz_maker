class WeightsController < ApplicationController

  def new
    @answer = Answer.find(params[:answer_id])
    @weight = Weight.new
  end

  def create
    @answer = Answer.find(params[:answer_id])
    @weight = Weight.new(weight_params)
    if @weight.save
      redirect_to edit_answer_path @answer
    else
      render :new
    end
  end

  private

  def weight_params
    params.require(:weight).permit(:strength, :outcome_id).merge(answer: @answer)
  end

end
