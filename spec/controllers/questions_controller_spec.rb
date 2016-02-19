require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:quiz) { FactoryGirl.create(:quiz) }

  it 'renders the new template with a new question' do

    get :new, quiz_id: quiz.id

    expect(response).to render_template(:new)
    expect(response).to have_http_status(200)
    expect(assigns(:question)).to be_a_new(Question)
    expect(assigns(:quiz)).to eq(quiz)
  end

  it 'redirects to the edit quiz page on successful create' do
    question_attributes = FactoryGirl.attributes_for(:question)
    post :create, quiz_id: quiz.id, question: question_attributes

    expect(response).to redirect_to(edit_quiz_path(quiz))
    expect(response).to have_http_status(302)
    expect(assigns(:quiz)).to eq(quiz)
  end

end
