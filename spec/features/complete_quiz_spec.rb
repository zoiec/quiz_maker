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
    visit quiz_path(quiz)
    begin_quiz

    until(quiz.completed? user)
      answer_question
    end

    expect(current_path).to eq(quiz_result_path(quiz))
    expect(Result.includes(:outcome).includes(:quiz).where("quizzes.id = ? AND user_id = ?", quiz.id, user.id).references(:quizzes)).not_to be_empty
  end


  def setup_quiz
    quiz = FactoryGirl.create(:quiz, 
                              intro_content: "Santa will find out!",
                              title: "Naughty or Nice?",
                              url: "naughty-or-nice")
    quiz.questions << create_question(quiz)
    #map_outcomes
    quiz
  end

  def create_user
    user = FactoryGirl.create(:user)
    login_as(user)
    user
  end

  def create_question quiz
    FactoryGirl.create(:question, question_attrs).tap do |question|
      nice = FactoryGirl.create(:choice, body: "Nice")
      nice_weight = FactoryGirl.create(:weight, 
                                       choice: nice, 
                                       strength: 1, 
                                       outcome: FactoryGirl.create(:outcome, 
                                                                   name: "Nice",
                                                                   quiz: quiz))
      naughty = FactoryGirl.create(:choice, body: "Naughty")
      naughty_weight = FactoryGirl.create(:weight, 
                                          choice: naughty, 
                                          strength: 1,
                                          outcome: FactoryGirl.create(:outcome,
                                                                     name: "Naughty",
                                                                     quiz: quiz))
      question.choices = [naughty, nice]
    end
  end
  
  def question_attrs
    { body: "Have you been naughty or nice this year?" }
  end

  def answer_question 
    choose("Nice")
    click_on("Next")
  end

  def begin_quiz
    click_on "Get Started"
  end

  def expect_to_see_my_result
    expect(page).to have_content("My result")
  end

end
