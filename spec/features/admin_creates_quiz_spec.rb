require "rails_helper"

RSpec.feature "Admin creates quiz" do

  let(:title) { Faker::Lorem.sentence(3) }

  scenario "succesfully with valid information" do
    warden_login_as_admin

    visit new_quiz_path
    fill_in "Title", with: title
    fill_in "Slug", with: Faker::Internet.slug
    fill_in "Intro content", with: Faker::Lorem.paragraph 

    click_on("Create Quiz")

    expect(Quiz.all.count).to eq(1)
    expect(current_path).to eq(edit_quiz_path(Quiz.first))
    expect(page).to have_content(title)
  end

  scenario "unsuccessfully with invalid information" do
    warden_login_as_admin

    visit new_quiz_path
    expect(page).not_to have_css('.error')

    click_on "Create Quiz"

    expect(page).to have_css('.error', text: "can't be blank")

  end


end
