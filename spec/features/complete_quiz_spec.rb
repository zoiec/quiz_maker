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

    visit question_path(quiz.first_question)
    answer_question quiz.first_question
  end


  def setup_quiz
    quiz = FactoryGirl.create(:quiz)
    quiz.questions << create_question(5)
    quiz
  end

  def create_question num_choices
    question = FactoryGirl.create(:question)
    num_choices.times do
      question.choices << FactoryGirl.create(:choice, body: Faker::Lorem.sentence)
    end
    question
  end

  def answer_question question
    click_on(random_choice(question))
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
