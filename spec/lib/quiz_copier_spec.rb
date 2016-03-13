require "rails_helper"

describe QuizCopier do

  it "copies a quiz by changing it's slug and title" do
    quiz = FactoryGirl.create(:quiz, slug: "old-quiz", title: "Old Quiz")

    copy = QuizCopier.copy(quiz)

    expect(copy.slug).to eq("old-quiz-copy")
    expect(copy.title).to eq("Old Quiz Copy")
  end

  it "copies its questions as well" do
    quiz = FactoryGirl.create(:quiz, slug: "old-quiz", title: "Old Quiz")
    question = FactoryGirl.create(:question, quiz: quiz)

    copy = QuizCopier.copy(quiz)

    expect(copy.slug).to eq("old-quiz-copy")
    expect(copy.title).to eq("Old Quiz Copy")
    expect(copy.questions.count).to eq(1)
  end

  it "copies outcomes" do
    quiz = FactoryGirl.create(:quiz, slug: "old-quiz", title: "Old Quiz")
    outcome = FactoryGirl.create(:outcome, quiz: quiz)

    copy = QuizCopier.copy(quiz)

    expect(copy.outcomes.count).to eq(1)
  end

  it "copies choices" do
    quiz = FactoryGirl.create(:quiz, slug: "old-quiz", title: "Old Quiz")
    question = FactoryGirl.create(:question, quiz: quiz)
    choice = FactoryGirl.create(:choice, question: question)

    copy = QuizCopier.copy(quiz)

    expect(copy.choices.count).to eq(1)
  end
end
