class Quiz < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug, use: :slugged
  has_many :outcomes
  has_many :questions
  has_many :choices, through: :questions
  validates :title, presence: true
  validates :slug, presence: true, uniqueness: true, format: { with: /\A[\da-zA-Z\-_]*\z/ }

  scope :published, -> { where(published: true) }

  def publish!
    self.update_attributes(published: true, published_at: Time.now)
  end

  def compute_result user
    outcome_totals = {}
    answers = Answer.includes(:weights).where(user: user, choice: choices)
    answers.each do |answer|
      answer.weights.each do |weight|
        if(outcome_totals.has_key? weight.outcome_id)
          outcome_totals[weight.outcome_id] += weight.strength
        else
          outcome_totals[weight.outcome_id] = weight.strength
        end
      end
    end
    outcome_id = outcome_totals.sort.first[0]
    result = Result.where(outcome: outcomes, user: user).first
    if(result.nil?)
      Result.create(user: user, outcome_id: outcome_id)
    else
      result.update_attribute(:outcome_id, outcome_id)
      result
    end
  end

  def first_question
    questions.first
  end

  def completed?(user)
    !questions_left? user
  end

  private

  def questions_left?(user)
    unanswered_questions(user).count > 0
  end

  def answered_questions(user)
    questions.select { |q| q.answered(user) }
  end

  def unanswered_questions(user)
    questions.select { |q| !q.answered(user) }
  end

  def next_unanswered_question(user)
    questions.find { |q| !q.answered(user) }
  end


end
