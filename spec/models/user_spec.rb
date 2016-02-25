require 'rails_helper'

describe User do


  it 'has a valid factory' do

    expect { FactoryGirl.create(:user) } .not_to raise_error

  end

  it 'can be an admin' do

    user = FactoryGirl.create(:user, admin: true)

    expect(user.admin?).to eq(true)

  end

end
