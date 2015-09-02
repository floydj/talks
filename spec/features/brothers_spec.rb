require 'rails_helper'

RSpec.feature "Brothers", type: :feature do
  let(:brother) { create(:brother) }
  let(:outlines) { %w(1 3 5) }
  let(:congregation) { create(:congregation) }

  scenario 'add outlines for brother' do
    create_list :outline, 5
    visit brother_path(brother)
    outlines.each do |num|
      check num
    end

    click_button 'Save'
    outlines.each do |num|
      expect(page).to have_checked_field num
    end

    expect(brother.outlines.pluck(:number).join(',')).to eql "1,3,5"
  end

  scenario 'adds multiple' do
    visit congregation_path(congregation)
    click_link 'Add Multiple Brothers'

    fill_in 'brothers', with: "John Doe\nBob Johson\nJerry Smith"
    click_button 'Add Brothers'

    expect(Brother.count).to eql 3
    expect(Brother.first.last_name).to eql 'Doe'
  end
end
