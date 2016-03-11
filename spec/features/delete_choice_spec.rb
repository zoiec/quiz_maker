require "rails_helper"

feature "delete choice" do
  scenario "successfully as admin" do
    choice = FactoryGirl.create(:choice)
    warden_login_as_admin

    visit(edit_choice_path(choice))

    click_on "Delete Choice"

    expect(Choice.all.count).to be(0)
  end

end
