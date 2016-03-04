require_relative "question_state"

class QuizState

  def initialize
    @questions = []
  end

  def compute_outcome
    outcome_scores = {}
    @questions.each do |question|
      unless(outcome_scores.has_key? question.answer.outcome)
        outcome_scores[question.answer.outcome] = 0
      end
      outcome_scores[question.answer.outcome] += question.answer.factor
    end
    outcome_scores.sort_by { |key, value| value } .first[0]
  end

  def completed?
    !questions_left?
  end

  def questions_left?
    unanswered_questions.size > 0
  end

  def unanswered_questions
    @questions.select(&:answered?)
  end

  def add_question question
    @questions << question
  end

  def next_question
    @questions.find(&:answered?)
  end

  def result
    compute_outcome
  end

end
