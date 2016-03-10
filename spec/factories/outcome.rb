require "faker"

FactoryGirl.define do

  factory :outcome do
    name Faker::Lorem.sentence
    body Faker::Lorem.paragraph
    association :quiz
  end

end
