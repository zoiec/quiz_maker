require 'rails_helper'

RSpec.describe WeightsController do

  let(:choice) { FactoryGirl.create(:choice) }

  it 'responds to the new action' do

    get :new, choice_id: choice.id

    expect(assigns(:choice)).to eq(choice)
    expect(assigns(:weight)).to be_a_new(Weight)
    expect(response).to render_template(:new)
  end
  
  it 'responds to the create action' do
    weight_attrs = FactoryGirl.attributes_for(:weight, choice: choice)

    post :create, choice_id: choice.id, weight: weight_attrs

    expect(response).to redirect_to(edit_choice_path choice)
  end

end
