FactoryGirl.define do

  factory :weight do
    association :outcome
    association :answer
    strength Random.rand(10)
  end

end
