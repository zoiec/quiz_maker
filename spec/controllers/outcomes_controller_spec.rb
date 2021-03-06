require 'rails_helper'

RSpec.describe OutcomesController do

  let(:quiz) { FactoryGirl.create(:quiz) }

  it 'renders new when the new action is called' do
    get :new, quiz_id: quiz.id

    expect(response).to render_template(:new)
    expect(response).to have_http_status(200)
    expect(assigns(:outcome)).to be_a_new(Outcome)
    expect(assigns(:quiz)).to eq(quiz)
  end

  it 'renders show when the create action is called with valid data' do
    outcome_attributes = FactoryGirl.attributes_for(:outcome)
    post :create, quiz_id: quiz.id, outcome: outcome_attributes

    expect(response).to redirect_to(edit_quiz_path quiz)
    expect(response).to have_http_status(302)
    expect(quiz.outcomes).not_to be_empty
  end

  it 'renders the edit screen when the edit action is called' do
    outcome = FactoryGirl.create(:outcome)

    get :edit, id: outcome.id

    expect(assigns(:outcome)).to eq(outcome)
    expect(response).to render_template(:edit)
  end

  describe "#update" do
    it "updates the outcome if the user is logged in as admin" do
      devise_login_as_admin
      outcome = FactoryGirl.create(:outcome)

      post :update, id: outcome.id, outcome: { name: "New Name" } 

      outcome.reload
      expect(outcome.name).to eq("New Name")
    end

    it "raises an error if the user is not an admin" do
      devise_login_as_user

      outcome = FactoryGirl.create(:outcome)

      expect { post :update, id: outcome.id, outcome: { name: "New Name" } } .to raise_exception(Pundit::NotAuthorizedError)
    end
  end
end
