require 'rails_helper'

RSpec.describe ChoicesController do

  let(:choice) { FactoryGirl.create(:choice) }

  it 'returns an choice on the edit action' do
    
    get :edit, id: choice.id

    expect(assigns(:choice)).to eq(choice)
    expect(response).to render_template(:edit)
  end

  it 'handles the new action correctly'

  it 'handles the create action correctly'


end
