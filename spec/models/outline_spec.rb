require 'rails_helper'

RSpec.describe Outline, type: :model do
  let(:outline) { build_stubbed(:outline) }

  it 'gives title with number' do
    expect(outline.title_with_number).to eql "#{outline.number} - #{outline.title}"
  end
end
