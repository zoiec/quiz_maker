require 'rails_helper'

RSpec.describe QuizzesController, type: :controller, focus: false do

  before(:each) do
    devise_login_as_admin
  end
  
  context "#new" do

    it 'assigns a new quiz' do
      get :new

      expect(assigns(:quiz)).to be_a_new(Quiz)
    end

    it 'renders the new page after the new action is called' do
      get :new

      expect(response).to render_template(:new)
    end
  end

  context '#create' do
    it 'renders the edit template of the newly created quiz' do
      quiz_attrs = FactoryGirl.attributes_for(:quiz)
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      post :create, quiz: quiz_attrs

      expect(response).to render_template(:edit)
    end

    it 'returns a 201' do
      quiz_attrs = FactoryGirl.attributes_for(:quiz)
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      post :create, quiz: quiz_attrs

      expect(response).to have_http_status(201)
    end

    it 'creates a quiz' do
      quiz_attrs = FactoryGirl.attributes_for(:quiz)

      post :create, quiz: quiz_attrs

      expect(Quiz.count).to eq(1)
    end

    it 'renders the new page when create is called with invalid data' do
      post :create, quiz: {title: ''}

      expect(response).to render_template(:new)
    end

    it 'returns a 422 when create is called with invalid data' do
      post :create, quiz: {title: ''}

      expect(response).to have_http_status(422)
    end

    it 'does not create a quiz when create is called with invalid data' do
      post :create, quiz: {title: ''}

      expect(Quiz.all).to be_empty
    end
  end

  context '#index' do
    it 'renders index when index is called' do
      get :index

      expect(response).to render_template(:index)
    end

    it 'returns a 200 status when index is called' do
      get :index

      expect(response).to have_http_status(200)
    end

    it 'returns a list of all quizzes when index is called' do
      get :index

      expect(assigns(:quizzes)).to eq(Quiz.all)
    end
  end

  context '#show' do
    it 'renders the show action when show is called' do
      quiz = FactoryGirl.create(:quiz)

      get :show, id: quiz.id

      expect(response).to render_template(:show)
    end
    
    it 'returns a 200 status when show is called' do
      quiz = FactoryGirl.create(:quiz)

      get :show, id: quiz.id

      expect(response).to have_http_status(200)
    end
    
    it 'returns the correct quiz when show is called' do
      quiz = FactoryGirl.create(:quiz)

      get :show, id: quiz.id

      expect(assigns(:quiz)).to eq(quiz)
    end
  end

end
