FactoryGirl.define do

  factory :result do
    association :outcome
    association :user
  end

end
