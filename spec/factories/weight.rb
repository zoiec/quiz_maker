FactoryGirl.define do

  factory :weight do
    association :outcome
    association :choice
    strength Random.rand(10)
  end

end
