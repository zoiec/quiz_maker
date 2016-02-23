require 'rails_helper'

RSpec.describe Weight do

  it 'has a valid factory' do
    expect { FactoryGirl.create(:weight) } .not_to raise_error
  end

  it 'is not valid without an answer'

  it 'is not valid without an outcome'

  it 'is not valid without a strength between 0 and 10'

end
