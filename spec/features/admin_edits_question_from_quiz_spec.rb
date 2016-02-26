require 'rails_helper'

RSpec.feature 'Admin edits question from quiz' do

  before(:each) do
    warden_login_as_admin
  end

  let(:quiz) { FactoryGirl.create(:quiz) }
  let!(:question) { FactoryGirl.create(:question, quiz: quiz) }

  scenario 'by changing its body' do

    visit(edit_quiz_path quiz)
    click_on "Edit Question"



  end

end
