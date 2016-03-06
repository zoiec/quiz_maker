class Answer < ActiveRecord::Base
  belongs_to :choice
  has_one :question, through: :choice
  has_many :weights, through: :choice
  belongs_to :user
  validates :choice, presence: true
end
