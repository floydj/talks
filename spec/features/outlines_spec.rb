require 'rails_helper'

RSpec.feature "Outlines", type: :feature do

  scenario 'create' do
    visit new_outline_path
    fill_in 'Title', with: 'Test Outline Title'
    fill_in 'Number', with: 5
    click_button 'Save'

    expect(Outline.count).to eql 1
    expect(Outline.first.title).to eql 'Test Outline Title'
    expect(Outline.first.number).to eql 5
  end
end
