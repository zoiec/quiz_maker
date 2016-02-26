require 'rails_helper'

RSpec.feature 'Admin adds an answer to a question' do
  before(:each) do
    warden_login_as_admin
  end

  let(:question) { FactoryGirl.create(:question, :with_quiz) }

  scenario 'successfully with valid data' do
    visit edit_question_path(question.id)

    click_on "Add Answer"
    fill_in 'Body', with: Faker::Lorem.sentence
    click_on "Create Answer"

    expect(question.answers.count).to eq(1)

  end

  scenario 'unsuccessfully with invalid data'

end
