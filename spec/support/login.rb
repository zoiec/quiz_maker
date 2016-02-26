def devise_login_as_admin
  user = FactoryGirl.create(:user, admin: true)
  sign_in(user)
end

def warden_login_as_admin
  user = FactoryGirl.create(:user, admin: true)
  login_as(user, scope: :user)
end
