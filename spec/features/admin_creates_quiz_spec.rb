require "rails_helper"

RSpec.feature "Admin creates quiz" do

  before(:each) do
    user = FactoryGirl.create(:user)
    login_as(user, scope: :user)
  end

  let(:title) { Faker::Lorem.sentence(3) }

  scenario "succesfully with valid information" do
    
    visit new_quiz_path
    fill_in "Title", with: title
    fill_in "Url", with: Faker::Internet.url('') 
    fill_in "Intro content", with: Faker::Lorem.paragraph 

    click_on("Create Quiz")
   
    expect(current_path).to eq(quizzes_path)
    expect(page).to have_content(title)
  end

  scenario "unsuccessfully with invalid information" do

    visit new_quiz_path
    expect(page).not_to have_css('.error')

    click_on "Create Quiz"

    expect(page).to have_css('.error', text: "can't be blank")

  end


end
