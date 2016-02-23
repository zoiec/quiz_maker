require 'rails_helper'

RSpec.feature 'Admin adds a weight to an answer' do

  let(:answer) { FactoryGirl.create(:answer) }

  scenario 'successfully with valid data' do

    visit(edit_answer_path answer)
    click_on "Add Weight"

  end


end
