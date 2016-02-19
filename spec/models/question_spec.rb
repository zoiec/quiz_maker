require 'rails_helper'

RSpec.describe Question, type: :model do

  it 'has a valid factory' do
    expect { FactoryGirl.create(:question) } .not_to raise_error
  end

  it 'is invalid without a body'

  it 'is invalid without a quiz'


end
