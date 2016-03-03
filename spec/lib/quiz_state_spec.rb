require_relative "../../app/lib/quiz_state"

describe QuizState do
  it 'allows users to take quizzes' do

    quiz = QuizState.new
    question = QuestionState.new(body: "Do you like programming?",
                                 choices: [ChoiceState.new(body: "Yes",
                                                           outcome: "Yes",
                                                           factor: 1)])
    quiz.add_question question

    while(quiz.questions_left?)
      answer(quiz.next_question)
    end

    expect(quiz).to be_completed
    expect(quiz.result).to eq("Yes")
  end

  it 'can have a question added to it' do
    quiz = QuizState.new
    question = QuestionState.new(body: "Do you like programming?",
                                 choices: [ChoiceState.new(body: "Yes",
                                                           outcome: "Yes",
                                                           factor: 1)])

    quiz.add_question question
  end

  def answer question
    question.select_choice(0)
  end

  def choose_random choices
    Random.rand(choices.length)
  end
end
