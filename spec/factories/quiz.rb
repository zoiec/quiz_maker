require "faker"

FactoryGirl.define do
  factory :quiz do
    title Faker::Book.title
    slug { Faker::Internet.slug.gsub(/\./, "-") }
    intro_content Faker::Lorem.paragraph
  end
end
