class Quiz < ActiveRecord::Base
  has_many :outcomes
  has_many :questions
  has_many :choices, through: :questions
  validates :title, presence: true
  validates :url, presence: true

  scope :published, -> { where(published: true) }

  def publish!
    self.update_attributes(published: true, published_at: Time.now)
  end

  def first_question
    questions.first
  end

  def completed?(user)
    !questions_left? user
  end

  def questions_left?(user)
    unanswered_questions(user).empty?
  end

  def answered_questions(user)
    questions.select { |q| q.answered(user) }
  end

  def unanswered_questions(user)
    questions.select { |q| !q.answered(user) }
  end

  def next_question(user)
    questions.find { |q| !q.answered(user) }
  end

end
