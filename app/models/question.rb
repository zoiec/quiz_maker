class Question < ActiveRecord::Base
  has_many :choices
  has_many :answers, through: :choices
  belongs_to :quiz
  validates :body, presence: true
  validates :quiz, presence: true

  def answered(user)
    !Answer.where(user_id: user, choice_id: choice_ids).empty?
  end
end
