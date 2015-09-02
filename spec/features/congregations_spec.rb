require 'rails_helper'

RSpec.feature "Congregations", type: :feature do

  scenario 'creates' do
    visit new_congregation_path
    fill_in 'Name', with: 'Happyville North'
    fill_in 'Meeting Time', with: '10:00 AM'
    fill_in 'Meeting Day', with: 'Sunday'
    click_button 'Save'
    expect(Congregation.count).to eql 1
  end

  context 'existing' do
    let!(:congregation) { create(:congregation) }

    scenario 'edit' do
      visit edit_congregation_path(congregation)
      fill_in 'Name', with: 'Happyville North'
      fill_in 'Meeting Time', with: '9:30 AM'
      fill_in 'Meeting Day', with: 'Saturday'
      fill_in 'Talk coordinator', with: 'Someone New'
      click_button 'Save'

      expect(Congregation.first.name).to eql 'Happyville North'
      expect(Congregation.first.talk_coordinator).to eql 'Someone New'
    end

    scenario 'Deletes' do
      visit congregations_path
      click_link 'Destroy'
      expect(Congregation).to_not be_any
    end
  end

  scenario 'add multiple' do
    visit congregations_path
    click_link 'Add Multiple'
    fill_in 'Congregations', with: "Town1\nTown2\nTown3"
    click_button 'Add Congregations'

    expect(Congregation.count).to eql 3
  end
end
