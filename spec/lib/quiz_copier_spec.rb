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

end
