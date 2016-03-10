require "faker"

FactoryGirl.define do

  factory :choice do
    body Faker::Lorem.sentence
    association :question
  end


end
