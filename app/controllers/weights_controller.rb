class WeightsController < ApplicationController

  def new
    @choice = Choice.find(params[:choice_id])
    @quiz = @choice.quiz
    @weight = Weight.new
  end

  def create
    @choice = Choice.find(params[:choice_id])
    @weight = Weight.new(weight_params)
    if @weight.save
      redirect_to edit_choice_path @choice
    else
      render :new
    end
  end

  private

  def weight_params
    params.require(:weight).permit(:strength, :outcome_id).merge(choice: @choice)
  end

end
