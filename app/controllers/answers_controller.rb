class AnswersController < ApplicationController

  def new
    handle_user_login
    @question = Question.find(params[:question_id])
    previous_answer = previous_answer_for_user(current_user)
    if(previous_answer)
      redirect_to edit_answer_path(previous_answer)
    else
      @answer = Answer.new
    end
  end

  def edit
    @answer = Answer.find(params[:id])
    authorize @answer
    @question = @answer.question
  end

  def update
    @answer = Answer.find(params[:id])
    authorize @answer
    @question = @answer.question
    @quiz = @question.quiz
    if(@answer.update_attributes(answer_params))
      redirect_to next_step(current_user, @question, @quiz)
    else
      render :edit
    end
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

  def handle_user_login
    unless(user_signed_in?)
      user = User.create(email: Faker::Internet.email,
                         password: Faker::Internet.password,
                         guest: true)
      sign_in(:user, user)
    end
  end

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

  def previous_answer_for_user user
    Answer.where(choice: @question.choices,
                 user: user).order(created_at: :desc).limit(1).first
  end
end
