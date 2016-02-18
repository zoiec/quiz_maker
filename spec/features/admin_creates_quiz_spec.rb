require "rails_helper"

RSpec.feature "Admin creates quiz" do

  let(:title) { Faker::Lorem.sentence(3) }

  scenario "with valid information" do
    
    visit new_quiz_path
    fill_in "Title", with: title
    fill_in "Url", with: Faker::Internet.url('') 
    fill_in "Intro content", with: Faker::Lorem.paragraph 

    click_on("Create Quiz")
   
    expect(current_path).to eq(quizzes_path)
    expect(page).to have_content(title)
  end

end
