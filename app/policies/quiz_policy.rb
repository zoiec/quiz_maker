class QuizPolicy < ApplicationPolicy

  def initialize(user, quiz)
    @user = user
    @quiz = quiz
    super
  end

  def edit?
    @user.admin?
  end

end
