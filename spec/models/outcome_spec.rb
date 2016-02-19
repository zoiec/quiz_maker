require 'rails_helper'

RSpec.describe Outcome do

  let(:quiz) { FactoryGirl.create(:quiz) }

  it 'has a valid factory' do

    expect { FactoryGirl.create(:outcome) } .not_to raise_error

  end

  it 'fails validation without a name' do
    outcome = Outcome.new(quiz_id: quiz.id, name: '')

    expect(outcome.save).to be(false)
  end

  it 'fails validation without a quiz_id' do
    outcome = Outcome.new(quiz_id: '', name: Faker::Lorem.words(3))

    expect(outcome.save).to be(false)
  end

end
