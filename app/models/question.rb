class Question < ActiveRecord::Base
  has_many :choices
  has_many :answers, through: :choices
  belongs_to :quiz
  validates :body, presence: true
  validates :quiz, presence: true
  after_create :set_order

  def answered(user)
    !Answer.where(user_id: user, choice_id: choice_ids).empty?
  end

  def next_question
    Question.where(quiz: self.quiz, order: order + 1).first
  end

  def set_order
    max_order = Question.where(quiz: self.quiz).maximum(:order) || 0
    self.update_attribute(:order, max_order + 1)
  end
end
