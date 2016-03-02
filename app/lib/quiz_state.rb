require_relative "question_state"

class QuizState

  def initialize
    @questions = []
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
    #this is the one that starts to feel magical
    @questions.find(&:answered?)
  end

end
