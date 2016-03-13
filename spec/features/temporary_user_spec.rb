require "rails_helper"

feature "Temporary user" do

  scenario "for a new user" do
    quiz = setup_full_quiz
    visit quiz_path(quiz)

    click_on "Get Started"

    choose("Always")
    click_on("Next")
    choose("Yes")
    click_on("Next")
    expect(page).to have_content("You must create an account to view your results")


    expect(User.all.count).to eq(1)
  end

end
