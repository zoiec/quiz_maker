def devise_login_as_admin
  user = FactoryGirl.create(:user, admin: true)
  sign_in(user)
end

def warden_login_as_admin
  user = FactoryGirl.create(:user, admin: true)
  login_as(user, scope: :user)
end

def warden_login_as_user
  user = FactoryGirl.create(:user)
  login_as(user, scope: :user)
end

def devise_login_as_user
  user = FactoryGirl.create(:user)
  sign_in(user)
end
