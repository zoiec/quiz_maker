require "rails_helper"

feature "Complete a quiz" do

  scenario "begin the quiz" do
    quiz = setup_full_quiz

    visit quiz_path(quiz)
    begin_quiz

    expect(page).to have_content(Question.first.body)
  end

  scenario "finish the rest of the quiz" do
    quiz = setup_full_quiz
    user = create_user
    visit quiz_path(quiz)
    begin_quiz

    #I wrote up this example and just hard-coded the answers.
    #Check out spec/factories/full_quiz.rb
    answer_question "Always"
    answer_question "Yes"

    expect(current_path).to eq(quiz_result_path(quiz))
    expect(Result.includes(:outcome).includes(:quiz).where("quizzes.id = ? AND user_id = ?", quiz.id, user.id).references(:quizzes)).not_to be_empty
  end


  def create_user
    user = FactoryGirl.create(:user)
    login_as(user)
    user
  end

  def answer_question answer
    choose(answer)
    click_on "Next"
  end

  def begin_quiz
    click_on "Get Started"
  end

end
