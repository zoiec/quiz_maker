require 'rails_helper'

RSpec.describe AnswersController do

  let(:answer) { FactoryGirl.create(:answer) }

  it 'returns an answer on the edit action' do
    
    get :edit, id: answer.id

    expect(assigns(:answer)).to eq(answer)
    expect(response).to render_template(:edit)
  end

  it 'handles the new action correctly'

  it 'handles the create action correctly'


end
