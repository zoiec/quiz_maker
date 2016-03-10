class QuizPolicy < ApplicationPolicy

  def initialize(user, quiz)
    @user = user
    @quiz = quiz
    super
  end

  def edit?
    @user.admin?
  end

  def new?
    @user.admin?
  end

  def create?
    @user.admin?
  end

  def index?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end
end
