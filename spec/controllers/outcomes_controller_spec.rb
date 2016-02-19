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

end
