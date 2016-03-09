class Result < ActiveRecord::Base
  belongs_to :outcome
  belongs_to :user
  has_one :quiz, through: :outcome
  validates :outcome, presence: true
  validates :user, presence: true

  def needs_recomputation?
    questions = Question.where(quiz: quiz.id)
    answers = Answer.includes(:choice).where(choices: {question_id: questions.ids}, user: user).references(:choices)
    answer_updated_at = answers.maximum(:updated_at)
    answer_updated_at > updated_at
  end
end
