require 'rails_helper'

RSpec.feature 'Admin edits a quiz from the home page' do

  before(:each) do
    warden_login_as_admin
  end

  let!(:quiz) { FactoryGirl.create(:quiz) }

  scenario 'by changing the name' do
    visit root_path
    click_on "Edit Quiz"
  end


end

