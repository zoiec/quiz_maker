require 'rails_helper'

RSpec.describe Weight do

  it 'has a valid factory' do
    expect { FactoryGirl.create(:weight) } .not_to raise_error
  end

  it 'is not valid without an choice' do
    weight = FactoryGirl.build(:weight, choice: nil)

    expect(weight.save).to be(false)
  end

  it 'is not valid without an outcome' do
    weight = FactoryGirl.build(:weight, outcome: nil)

    expect(weight.save).to be(false)
  end

  it 'is not valid without a strength greater than 0' do
    weight = FactoryGirl.build(:weight, strength: 0)

    expect(weight.save).to be(false)
  end

end
