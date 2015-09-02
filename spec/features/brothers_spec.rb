require 'rails_helper'

RSpec.feature "Brothers", type: :feature do
  let(:brother) { create(:brother) }
  let(:outlines) { %w(1 3 5) }

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
end
