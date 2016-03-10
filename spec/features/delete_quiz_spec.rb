require "rails_helper"

feature "Delete quiz" do

  scenario "successfully as an admin" do
    warden_login_as_admin
    quiz = FactoryGirl.create(:quiz)

    visit edit_quiz_path(quiz)
    click_on "Delete Quiz"

    expect(Quiz.all.count).to eq(0)
  end

  scenario "unsuccessfully as a non-admin"
end
