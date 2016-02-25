require 'rails_helper'

feature 'A regular user cannot edit a quiz' do

  let(:quiz) { FactoryGirl.create(:quiz) }

  scenario 'without logging in' do

    visit(edit_quiz_path quiz)

    expect(current_path).to eq(new_user_session_path)

  end

end
