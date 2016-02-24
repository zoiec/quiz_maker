require 'rails_helper'

RSpec.feature 'Admin edits question from quiz' do

  let(:quiz) { FactoryGirl.create(:quiz) }
  let!(:question) { FactoryGirl.create(:question, quiz: quiz) }

  scenario 'by changing its body' do

    visit(edit_quiz_path quiz)
    click_on "Edit Question"



  end

end
