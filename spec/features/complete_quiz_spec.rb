require "rails_helper"

feature "Complete a quiz" do

  scenario "begin the quiz" do
    quiz = setup_quiz

    visit quiz_path(quiz)
    begin_quiz

    expect(page).to have_content(Question.first.body)
  end

  scenario "finish the rest of the quiz"


  def setup_quiz
    quiz = FactoryGirl.create(:quiz)
    quiz.questions << FactoryGirl.create(:question)
    quiz
  end

  def begin_quiz
    click_on "Get Started"
  end

  def expect_to_see_my_result
    expect(page).to have_content("My result")
  end

end
