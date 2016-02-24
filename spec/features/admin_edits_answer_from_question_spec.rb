require 'rails_helper'

RSpec.feature 'Admin edits answer from question' do

  let(:question) { FactoryGirl.create(:question) }
  let!(:answer) { FactoryGirl.create(:answer, question: question) }

  scenario 'by changing its body' do

    visit(edit_question_path question.id)
    click_on "Edit Answer"

  end

end
