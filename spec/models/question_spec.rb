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

  it 'is given an order when it is added to a quiz' do
    quiz = FactoryGirl.create(:quiz)
    question_1 = FactoryGirl.create(:question, quiz: quiz)
    question_2 = FactoryGirl.create(:question, quiz: quiz)

    expect(question_1.order).to eq(1)
    expect(question_2.order).to eq(2)
  end


end
