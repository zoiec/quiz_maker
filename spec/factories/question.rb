require "faker"

FactoryGirl.define do

  factory :question do
    body Faker::Lorem.sentence
    association :quiz
  end

  trait :with_quiz do
    after :create do |question|
      FactoryGirl.create(:quiz).tap do |quiz|
        question.update_attribute(:quiz, quiz)
      end
    end
  end
end
