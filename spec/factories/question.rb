FactoryGirl.define do

  factory :question do
    body Faker::Lorem.sentence
    association :quiz
  end

end
