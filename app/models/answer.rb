class Answer < ActiveRecord::Base
  belongs_to :choice
  has_one :question, through: :choice
  has_many :weights, through: :choice
  belongs_to :user
  validates :choice, presence: true
  validate :user_cannot_answer_question_twice

  def user_cannot_answer_question_twice
    answer_ids = Answer.includes(:choice).where(user: user, choices: { question_id: question.id }).references(:choices).ids
    unless (answer_ids - [self.id]).empty?
      errors.add(:choice, "You've already answered this question")
    end
  end
end
