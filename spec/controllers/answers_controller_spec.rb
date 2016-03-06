require "rails_helper"

describe AnswersController, type: :controller do

  it "creates an answer and redirects to the next question" do
    devise_login_as_user
    quiz = setup_quiz
    answer = { choice_id: Choice.first.id }

    post :create, question_id: quiz.questions.first.id, answer: answer

    expect(Answer.all.count).to eq(1)
  end

  def setup_quiz
    quiz = FactoryGirl.create(:quiz)
    question = FactoryGirl.create(:question)
    choice = FactoryGirl.create(:choice, question: question)
    quiz.questions << question
    quiz
  end
end
