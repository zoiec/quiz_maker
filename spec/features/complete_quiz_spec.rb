require "rails_helper"

feature "Complete a quiz" do

  scenario "begin the quiz" do
    quiz = setup_quiz

    visit quiz_path(quiz)
    begin_quiz

    expect(page).to have_content(Question.first.body)
  end

  scenario "finish the rest of the quiz" do
    quiz = setup_quiz
    user = create_user
    until(quiz.completed? user)
      current_question = quiz.next_question user
      visit new_question_answer_path(current_question)
      answer_question(current_question)
    end
    expect(Result.includes(:outcome).includes(:quiz).where("quizzes.id = ? AND user_id = ?", quiz.id, user.id).references(:quizzes)).not_to be_empty
  end


  def setup_quiz
    quiz = FactoryGirl.create(:quiz)
    quiz.questions << create_question(5)
    quiz
  end

  def create_user
    user = FactoryGirl.create(:user)
    login_as(user)
    user
  end

  def create_question num_choices
    question = FactoryGirl.create(:question)
    num_choices.times do
      question.choices << FactoryGirl.create(:choice, body: Faker::Lorem.sentence)
    end
    question
  end

  def answer_question question
    choose(random_choice(question))
  end

  def random_choice(question)
    random_index = Random.rand(question.choices.size)
    question.choices[random_index].body
  end

  def begin_quiz
    click_on "Get Started"
  end

  def expect_to_see_my_result
    expect(page).to have_content("My result")
  end

end
