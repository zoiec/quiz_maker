require 'rails_helper'

RSpec.describe Answer do

  it 'has a valid factory' do
    expect { FactoryGirl.create(:answer) } .not_to raise_error

  end

  it 'requires a question association' do
    answer = FactoryGirl.build(:answer, question: nil)

    expect(answer.save).to eq(false)
  end

  it 'requires a body' do
    answer = FactoryGirl.build(:answer, body: '')
    
    expect(answer.save).to eq(false)
  end

end
