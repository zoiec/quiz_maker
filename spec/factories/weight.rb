FactoryGirl.define do

  factory :weight do
    association :outcome
    association :choice
    strength { 1 + Random.rand(9) }
  end

end
