class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :answers
  has_many :weights
  validates :question, presence: true
  validates :body, presence: true

end
