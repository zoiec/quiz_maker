class QuizCopier

  def self.copy(old_quiz)
    quiz_copy = Quiz.new(old_quiz.attributes)
    quiz_copy.slug += "-copy"
    quiz_copy.title += " Copy"
    quiz_copy.id = nil
    quiz_copy.save
    quiz_copy
  end

end
