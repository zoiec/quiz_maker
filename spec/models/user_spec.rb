require 'rails_helper'

describe User do


  it 'has a valid factory' do

    expect { FactoryGirl.create(:user) } .not_to raise_error

  end

  it 'can be an admin' do

    user = FactoryGirl.create(:user, admin: true)

    expect(user.admin?).to eq(true)

  end

  it "can be a guest" do
    user = FactoryGirl.create(:user,
                              guest_id: "Secret",
                              guest: true,
                              email: "",
                              password: "")

    expect(user).to be_valid
  end

end
