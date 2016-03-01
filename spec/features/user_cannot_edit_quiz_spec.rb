require 'rails_helper'

feature 'A regular user cannot edit a quiz' do

  scenario 'without logging in' do
    quiz = FactoryGirl.create(:quiz)

    visit(edit_quiz_path quiz)

    expect(current_path).to eq(new_user_session_path)
  end

end
