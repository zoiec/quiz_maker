require "rails_helper"

RSpec.feature "Admin creates quiz" do

  scenario "with valid information" do
    
    visit new_quiz_path
    fill_in "Title", with: "My New Title"
    fill_in "Url", with: "my-new-quiz" 
    click_on("Create Quiz")
   
    expect(current_path).to eq(quizzes_path)
    expect(page).to have_content("My New Title")
  end

end
