class AnswerPolicy < ApplicationPolicy

  def initialize(user, answer)
    @user = user
    @answer = answer
    super
  end

  def edit?
    @answer.user == user
  end

end
