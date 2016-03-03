class Result < ActiveRecord::Base
  belongs_to :outcome
  belongs_to :user
  has_one :quiz, through: :outcome
end
