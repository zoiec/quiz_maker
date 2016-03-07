require 'rails_helper'

RSpec.describe QuizzesController, type: :controller, focus: false do

  context "#new" do

    it 'assigns a new quiz' do
      devise_login_as_admin

      get :new

      expect(assigns(:quiz)).to be_a_new(Quiz)
    end

    it 'renders the new page' do
      devise_login_as_admin

      get :new

      expect(response).to render_template(:new)
    end

    it "redirects to login if the user isn't logged in" do
      get :new

      expect_response_to_redirect_to_login
    end

    it "doesn't allow non-admin users access" do
      devise_login_as_user

      expect { get :new } .to raise_pundit_exception
    end
  end

  context '#create' do
    it 'redirects to the edit page of the newly created quiz' do
      devise_login_as_admin

      quiz_attrs = FactoryGirl.attributes_for(:quiz)
      post :create, quiz: quiz_attrs

      expect(response).to redirect_to(edit_quiz_path(Quiz.first))
    end

    it 'returns a 302' do
      devise_login_as_admin

      quiz_attrs = FactoryGirl.attributes_for(:quiz)
      post :create, quiz: quiz_attrs

      expect(response).to have_http_status(302)
    end

    it 'creates a quiz' do
      devise_login_as_admin

      quiz_attrs = FactoryGirl.attributes_for(:quiz)

      post :create, quiz: quiz_attrs

      expect(Quiz.count).to eq(1)
    end

    it 'renders the new page when create is called with invalid data' do
      devise_login_as_admin

      post :create, quiz: {title: ''}

      expect(response).to render_template(:new)
    end

    it 'returns a 422 when create is called with invalid data' do
      devise_login_as_admin

      post :create, quiz: {title: ''}

      expect(response).to have_http_status(422)
    end

    it 'does not create a quiz when create is called with invalid data' do
      devise_login_as_admin

      post :create, quiz: {title: ''}

      expect(Quiz.all).to be_empty
    end

    it "doesn't allow non-admin users access" do
      devise_login_as_user

      expect { post :create } .to raise_pundit_exception
    end
  end

  context '#index' do
    it 'renders index when index is called' do
      devise_login_as_admin

      get :index

      expect(response).to render_template(:index)
    end

    it 'returns a 200 status when index is called' do
      devise_login_as_admin

      get :index

      expect(response).to have_http_status(200)
    end

    it 'returns a list of all quizzes when index is called' do
      devise_login_as_admin

      get :index

      expect(assigns(:quizzes)).to eq(Quiz.all)
    end

    it "doesn't allow non-admin users access" do
      devise_login_as_user

      expect { get :index } .to raise_pundit_exception
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

  def expect_response_to_redirect_to_login
    expect(response).to redirect_to(new_user_session_path)
  end

  def raise_pundit_exception
    raise_error(Pundit::NotAuthorizedError)
  end

end
