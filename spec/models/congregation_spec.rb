require 'rails_helper'

RSpec.describe Congregation, type: :model do
  let(:congregation) { build_stubbed(:congregation) }

  it 'gives time and day' do
    expect(congregation.time_and_day).to eql "Sunday 10:00 AM"
  end
end
