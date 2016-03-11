class ChoicesController < ApplicationController

  def edit
    @choice = Choice.find(params[:id])
    authorize @choice
    @question = @choice.question
  end

  def new
    @question= Question.find(params[:question_id])
    @choice = Choice.new
  end

  def create
    @question = Question.find(params[:question_id])
    @choice = Choice.create(choice_params)
    if @choice.save
      redirect_to edit_question_path @question
    else
      render :new
    end
  end

  def update
    @choice = Choice.find(params[:id])
    authorize @choice
    @question = @choice.question
    if(@choice.update_attributes(choice_params))
      redirect_to edit_choice_path(@choice)
    else
      render :edit
    end
  end

  def destroy 
    @choice = Choice.find(params[:id])
    authorize @choice
    @question = @choice.question
    @choice.destroy
    redirect_to edit_question_path(@question)
  end

  private

  def choice_params
    params.require(:choice).permit(:body).merge(question: @question)
  end

end
