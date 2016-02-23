FactoryGirl.define do

  factory :answer do
    body Faker::Lorem.sentence
    association :question
  end


end
