class OutcomePolicy < ApplicationPolicy

  def initialize(user, outcome)
    @user = user
    @outcome = outcome
    super
  end

  def update?
    @user.admin?
  end

end
