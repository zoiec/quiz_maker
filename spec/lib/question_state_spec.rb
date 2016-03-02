require_relative "../../app/lib/question_state"

describe QuestionState do
  it "can be answered" do
    question = QuestionState.new(body: "Do you like programming?", choices: ["Yes", "No"])
    question.select_choice(0)
    expect(question.answer).to eq("Yes")
  end
end
