require 'rails_helper'

RSpec.feature 'Admin edits choice from question' do

  let(:question) { FactoryGirl.create(:question) }
  let!(:choice) { FactoryGirl.create(:choice, question: question) }

  scenario 'by changing its body' do
    warden_login_as_admin

    visit(edit_question_path question.id)
    click_on "Edit Choice"

  end

end
