def login_as_admin
  user = FactoryGirl.create(:user, admin: true)
  login_as(user, scope: :user)
end
