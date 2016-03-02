require 'rails_helper'

RSpec.describe Choice do

  it 'has a valid factory' do
    expect { FactoryGirl.create(:choice) } .not_to raise_error

  end

  it 'requires a question association' do
    choice = FactoryGirl.build(:choice, question: nil)

    expect(choice.save).to eq(false)
  end

  it 'requires a body' do
    choice = FactoryGirl.build(:choice, body: '')
    
    expect(choice.save).to eq(false)
  end

end
