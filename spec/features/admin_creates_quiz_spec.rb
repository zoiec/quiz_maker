require "rails_helper"

RSpec.feature "Admin creates quiz" do

  scenario "with valid information" do
    
    visit new_quiz_path
    fill_in "Title", with: "My New Title"
    fill_in :url, with: "my-new-quiz" 
    
  end

end
