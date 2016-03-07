require 'rails_helper'

feature 'Admin logs in' do

  scenario 'by visiting the login page directly' do
    user = FactoryGirl.create(:user, admin: true)

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    expect(page).to have_content(user.email)
  end

end
