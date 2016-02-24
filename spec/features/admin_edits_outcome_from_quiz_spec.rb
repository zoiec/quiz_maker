require 'rails_helper'

RSpec.feature 'Admin edits an outcome from a quiz' do

  let!(:quiz) { FactoryGirl.create(:quiz) }
  let!(:outcome) { FactoryGirl.create(:outcome, quiz: quiz) }

  scenario 'by changing the name' do
  
    visit(edit_quiz_path quiz)
    click_on "Edit Outcome"
    

  end

end
