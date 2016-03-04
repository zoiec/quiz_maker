class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @quiz = @question.quiz
    @answer = Answer.new(answer_params)
    if(@answer.save)
      if(@quiz.completed? current_user)
        redirect_to quiz_result_path(@quiz.id)
      else
        redirect_to new_question_answer_path(@quiz.next_question(current_user))
      end
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:choice_id).merge(user_id: current_user.id)
  end
end
