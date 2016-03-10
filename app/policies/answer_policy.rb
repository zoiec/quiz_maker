class AnswerPolicy < ApplicationPolicy

  def initialize(user, answer)
    @user = user
    @answer = answer
    super
  end

  def update?
    @answer.user == user
  end

end
