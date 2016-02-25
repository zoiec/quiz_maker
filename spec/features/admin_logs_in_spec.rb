require 'rails_helper'

feature 'Admin logs in' do

  let(:user) { FactoryGirl.create(:user) }

  scenario 'from the home page' do

    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    expect(page).to have_content(user.email)
  end

end
