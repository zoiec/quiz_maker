class ChoicePolicy < ApplicationPolicy

  def initialize(user, choice)
    @user = user
    @choice = choice
    super
  end

  def update?
    @user.admin?
  end

  def destroy?
    @user.admin?
  end

end
