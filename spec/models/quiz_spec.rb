require 'rails_helper'

RSpec.describe Quiz, type: :model do

  it 'has a valid factory' do
    expect { FactoryGirl.create(:quiz) }.not_to raise_error
  end
  
  it 'fails to validate if title is blank' do
    quiz = Quiz.new(title: '', slug: Faker::Internet.slug)

    expect(quiz.save).to be(false)
  end

  it 'fails to validate if slug is blank' do
    quiz = Quiz.new(title: Faker::Lorem.sentence, slug: '')

    expect(quiz.save).to be(false)
  end

  it 'can be published or not' do
    unpublished_quiz = FactoryGirl.create(:quiz)
    published_quiz = FactoryGirl.create(:quiz)

    published_quiz.publish!

    expect(Quiz.published).to include(published_quiz)
    expect(Quiz.published).not_to include(unpublished_quiz)
  end

  it 'is incomplete for a new user' do
    quiz = FactoryGirl.create(:quiz)
    FactoryGirl.create(:question, quiz: quiz)
    user = FactoryGirl.create(:user)

    expect(quiz.completed? user).to eq(false)
  end

  it 'fails to validate if slug contains spaces' do
    quiz = FactoryGirl.build(:quiz, slug: "my new slug")

    expect(quiz.save).to be(false)
  end

  it 'fails to validate if slug is not unique' do
    quiz = FactoryGirl.create(:quiz, slug: "dup_slug")
    quiz = FactoryGirl.build(:quiz, slug: "dup_slug")

    expect(quiz.save).to be(false)
  end

  it 'fails to validate if slug contains periods' do
    quiz = FactoryGirl.build(:quiz, slug: "my.new.slug")

    expect(quiz.save).to be(false)
  end
end
