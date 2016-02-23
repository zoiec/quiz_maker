require 'rails_helper'

RSpec.feature 'Admin user adds outcomes to a quiz' do

  let(:quiz) { FactoryGirl.create(:quiz) }

  scenario 'successfully with valid information' do
    outcome_name = Faker::Lorem.sentence

    visit(edit_quiz_path quiz)
    click_on 'Add Outcome'
    fill_in 'Body', with: Faker::Lorem.paragraph
    fill_in 'Name', with: outcome_name
    click_on 'Create Outcome'

    expect(quiz.outcomes).not_to be_empty
    expect(page).to have_content(outcome_name)
  end

  scenario 'unsuccessfully with invalid information' do

    visit(edit_quiz_path quiz)
    click_on 'Add Outcome'

    click_on 'Create Outcome'

    expect(page).to have_css('.error', text: "can't be blank")

  end

end
