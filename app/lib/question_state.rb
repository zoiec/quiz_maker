require "choice_state"
class NoAnswer
end

class QuestionState
  attr_reader :choices

  def initialize(options)
    @body = options[:body] || ""
    @choices = options[:choices] || []
    @answer = NoAnswer.new
  end

  def select_choice index
    @answer = @choices[index]
  end

  def answer
    @answer
  end

  def answered?
    @answer.kind_of?(NoAnswer)
  end
end
