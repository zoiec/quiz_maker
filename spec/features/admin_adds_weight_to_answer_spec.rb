require 'rails_helper'

RSpec.feature 'Admin adds a weight to an choice' do

  let(:choice) { FactoryGirl.create(:choice) }

  scenario 'successfully with valid data' do

    visit(edit_choice_path choice)
    click_on "Add Weight"

  end


end
