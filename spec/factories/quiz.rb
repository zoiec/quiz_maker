FactoryGirl.define do
  factory :quiz do
    title Faker::Book.title
    url Faker::Internet.slug
    intro_content Faker::Lorem.paragraph
  end
end
