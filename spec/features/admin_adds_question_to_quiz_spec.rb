require 'rails_helper'

RSpec.feature "User adds a question to a quiz" do

  let(:quiz) { FactoryGirl.create(:quiz) }

  scenario "successfully with valid data" do
    visit edit_quiz_path quiz
    click_on "Add Question"

    fill_in "Body", with: Faker::Lorem.sentence
    click_on "Create Question"
  end

  scenario "unsuccessfully with invalid data"


end
