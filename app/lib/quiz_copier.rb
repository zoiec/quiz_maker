class QuizCopier

  def self.copy(old_quiz)
    quiz_copy = Quiz.new(old_quiz.attributes)
    quiz_copy.slug += "-copy"
    quiz_copy.title += " Copy"
    quiz_copy.id = nil
    quiz_copy.save
    copy_outcomes(old_quiz, quiz_copy)
    copy_questions(old_quiz, quiz_copy)
    #copy outcomes, copy questions, copy answers, copy weights, etc.
    quiz_copy
  end

  def self.copy_outcomes(from, to)
    from.outcomes.each do |outcome|
      new_outcome = Outcome.new(outcome.attributes)
      new_outcome.id = nil
      to.outcomes << new_outcome
    end
  end

  def self.copy_questions(from, to)
    from.questions.each do |question|
      new_question = Question.new(question.attributes)
      new_question.id = nil
      copy_choices(question, new_question)
      to.questions << new_question
    end
  end

  def self.copy_choices(from, to)
    from.choices.each do |choice|
      new_choice = Choice.new(choice.attributes)
      new_choice.id = nil
      to.choices << new_choice
    end
  end

end
