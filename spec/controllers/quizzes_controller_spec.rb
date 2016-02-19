require 'rails_helper'

RSpec.describe QuizzesController, type: :controller do

  it 'renders the new page after the new action is called' do
    get :new

    expect(response).to render_template(:new)
    expect(assigns(:quiz)).to be_a_new(Quiz)
  end

  it 'creates a new Quiz when the create action is called with valid data' do
    quiz_attrs = FactoryGirl.attributes_for(:quiz)
    post :create, quiz: quiz_attrs

    expect(response).to render_template(:edit)
    expect(response).to have_http_status(201)
    expect(Quiz.all).not_to be_empty
  end

  it 'renders the new page when create is called with invalid data' do
    post :create, quiz: {title: ''}

    expect(response).to render_template(:new)
    expect(response).to have_http_status(422)
    expect(Quiz.all).to be_empty
  end

  it 'renders index with a list of quizzes when index is called' do
    get :index

    expect(response).to render_template(:index)
    expect(response).to have_http_status(200)
    expect(assigns(:quizzes)).to eq(Quiz.all)
  end

  it 'renders the show action with the correct quiz when show is called' do
    quiz = FactoryGirl.create(:quiz)

    get :show, id: quiz.id

    expect(response).to render_template(:show)
    expect(response).to have_http_status(200)
    expect(assigns(:quiz)).to eq(quiz)
  end

end
