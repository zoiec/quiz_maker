class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    previous_answer = Answer.where(choice: @question.choices, user: current_user).order(created_at: :desc).limit(1).first
    @previous_choice_id = (previous_answer.nil? ? "" : previous_answer.choice.id)
    @answer = Answer.new
  end

  def create
    @question = Question.find(params[:question_id])
    @quiz = @question.quiz
    @answer = Answer.new(answer_params)
    if(@answer.save)
      redirect_to next_step(current_user, @question, @quiz)
    else
      render :new
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:choice_id).merge(user_id: current_user.id)
  end
  
  def next_step(user, question, quiz)
    next_question = question.next_question
    if(!next_question)
      quiz_result_path(quiz)
    else
      new_question_answer_path(next_question)
    end
  end
end
