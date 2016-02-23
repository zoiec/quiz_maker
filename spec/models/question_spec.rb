require 'rails_helper'

RSpec.describe Question, type: :model do

  it 'has a valid factory' do
    expect { FactoryGirl.create(:question) } .not_to raise_error
  end

  it 'is invalid without a body' do

    question = FactoryGirl.build(:question, body: '')

    expect(question.save).to eq(false)

  end

  it 'is invalid without a quiz' do

    question = FactoryGirl.build(:question, quiz: nil)

    expect(question.save).to eq(false)

  end


end
