class QuizFacade
  def initialize quiz
    @quiz = quiz
  end

  def title
    @quiz.title
  end

  def intro_content
    @quiz.intro_content
  end

  def id
    @quiz.id
  end

  def first_question
    @quiz.questions.first
  end
end
