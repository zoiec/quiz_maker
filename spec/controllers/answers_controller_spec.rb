require "rails_helper"

describe AnswersController, type: :controller do

  describe "#new" do
    it "assigns a new answer" do
      devise_login_as_user
      quiz = setup_quiz

      get :new, question_id: quiz.questions.first.id

      expect(assigns(:answer)).to be_a_new(Answer)
    end

    it "does something if the user is not logged in"

    it "forwards to edit if the user has already answered the question" do
      devise_login_as_user
      quiz = setup_quiz
      answer = FactoryGirl.create(:answer, user: User.first, choice: Choice.first)

      get :new, question_id: quiz.questions.first.id

      expect(response).to redirect_to(edit_answer_path(answer))
    end
  end

  describe "#create" do
    it "creates an answer" do
      devise_login_as_user
      quiz = setup_quiz
      answer = { choice_id: Choice.first.id }

      post :create, question_id: quiz.questions.first.id, answer: answer

      expect(Answer.all.count).to eq(1)
    end

  end

  describe "#edit" do
    it "finds the answer" do
      devise_login_as_user
      quiz = setup_quiz
      answer = FactoryGirl.create(:answer, user: User.first, choice: Choice.first)

      get :edit, id: answer.id

      expect(assigns(:answer)).to eq(answer)
      expect(assigns(:question)).to eq(Question.first)
    end

    it "does not display an answer if it's not the correct user" do
      user = FactoryGirl.create(:user)
      devise_login_as_user
      answer = FactoryGirl.create(:answer, user: user)

      expect { get :edit, id: answer.id } .to raise_exception(Pundit::NotAuthorizedError)
    end
  end

  describe "#update" do
    it "updates the answer if it's the correct user" do
      devise_login_as_user
      quiz = setup_quiz
      answer = FactoryGirl.create(:answer, choice: Choice.first, user: User.first)
      choice = FactoryGirl.create(:choice, question: Question.first)

      post :update, id: answer.id, answer: {choice_id: choice.id}

      answer.reload
      expect(answer.choice).to eq(choice)
    end

    it "does not update the answer if it's the wrong user" do
      devise_login_as_user
      user = FactoryGirl.create(:user)
      quiz = setup_quiz
      answer = FactoryGirl.create(:answer, choice: Choice.first, user: user)
      choice = FactoryGirl.create(:choice, question: Question.first)

      expect { post :update, id: answer.id, answer: {choice_id: choice.id} } .to raise_error(Pundit::NotAuthorizedError)
    end

  end

  def setup_quiz
    quiz = FactoryGirl.create(:quiz)
    question = FactoryGirl.create(:question, quiz: quiz)
    choice = FactoryGirl.create(:choice, question: question)
    quiz
  end
end
