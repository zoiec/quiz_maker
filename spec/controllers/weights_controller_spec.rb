require 'rails_helper'

RSpec.describe WeightsController do

  let(:answer) { FactoryGirl.create(:answer) }

  it 'responds to the new action' do

    get :new, answer_id: answer.id

    expect(assigns(:answer)).to eq(answer)
    expect(assigns(:weight)).to be_a_new(Weight)
    expect(response).to render_template(:new)
  end
  
  it 'responds to the create action' do
    weight_attrs = FactoryGirl.attributes_for(:weight, answer: answer)

    post :create, answer_id: answer.id, weight: weight_attrs

    expect(response).to redirect_to(edit_answer_path answer)
  end

end
