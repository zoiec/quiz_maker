class Question < ActiveRecord::Base
  has_many :choices
  belongs_to :quiz
  validates :body, presence: true
  validates :quiz, presence: true


end
