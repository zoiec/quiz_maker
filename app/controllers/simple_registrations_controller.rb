class SimpleRegistrationsController < ApplicationController
  def create
    @user = User.from_email(user_params[:email])
    @quiz = Quiz.friendly.find(params[:quiz_id])
    if(@user.valid? && !@user.admin?)
      sign_in(:user, @user)
      redirect_to new_question_answer_path(@quiz.first_question)
    else
      render "quizzes/show"
    end
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
