require "faker"

FactoryGirl.define do
  factory :answer do
    association :user
    association :choice
  end
end
