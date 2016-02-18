require 'rails_helper'

RSpec.feature 'Admin user adds outcomes to a quiz' do

  let(:quiz) { FactoryGirl.create(:quiz) }

  scenario 'successfully with valid data' do

    visit(quiz_path quiz)
    click_on 'Add Outcome'
    fill_in 'Body', with: Faker::Lorem.paragraph
    click_on 'Create Outcome'
    expect(quiz.outcomes).not_to be_empty

  end

end
