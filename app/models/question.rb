class Question < ActiveRecord::Base
  has_many :answers
  belongs_to :quiz
  validates :body, presence: true
  validates :quiz, presence: true


end
