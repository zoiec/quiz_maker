require 'rails_helper'

RSpec.feature "User adds a question to a quiz" do

  before(:each) do
    user = FactoryGirl.create(:user, admin: true)
    login_as(user, scope: :user)
  end

  let(:quiz) { FactoryGirl.create(:quiz) }

  scenario "successfully with valid data" do
    question_body = Faker::Lorem.sentence
    visit edit_quiz_path(quiz)

    fill_in "Body", with: question_body
    click_on "Create Question"

    expect(Question.all.count).to be(1)
    expect(page).to have_content(question_body)
  end

  scenario "unsuccessfully with invalid data" do
    visit edit_quiz_path quiz
    click_on "Create Question"

    expect(Question.all.count).to be(0)
    expect(page).to have_content("can't be blank")
  end

end
