require "rails_helper"

describe Result do
  it 'has a valid factory' do
    expect { FactoryGirl.create(:result) } .not_to raise_error
  end

  it "is not valid without a outcome" do
    result = FactoryGirl.build(:result, outcome: nil)

    expect(result.valid?).to eq(false)
  end

  it "is not valid without a user" do
    result = FactoryGirl.build(:result, user: nil)

    expect(result.valid?).to eq(false)
  end

  describe "#needs_recomputation" do
    it "returns false if the result has been updated after all relevant answers" do
      quiz = FactoryGirl.create(:quiz)
      outcome = FactoryGirl.create(:outcome, quiz: quiz)
      question = FactoryGirl.create(:question, quiz: quiz)
      choice_1 = FactoryGirl.create(:choice, question: question)
      choice_2 = FactoryGirl.create(:choice, question: question)
      user = FactoryGirl.create(:user)
      answer = FactoryGirl.create(:answer, user: user, choice: choice_1)
      result = FactoryGirl.create(:result, user: user, outcome: outcome)

      expect(result.needs_recomputation?).to eq(false)
    end

    it "returns true if an answer has been updated after the result" do
      quiz = FactoryGirl.create(:quiz)
      outcome = FactoryGirl.create(:outcome, quiz: quiz)
      question = FactoryGirl.create(:question, quiz: quiz)
      choice_1 = FactoryGirl.create(:choice, question: question)
      choice_2 = FactoryGirl.create(:choice, question: question)
      user = FactoryGirl.create(:user)
      answer = FactoryGirl.create(:answer, user: user, choice: choice_1)
      result = FactoryGirl.create(:result, user: user, outcome: outcome)
      answer.update_attribute(:choice, choice_2)

      expect(result.needs_recomputation?).to eq(true)
    end
  end
end
