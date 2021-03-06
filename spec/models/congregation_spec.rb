require 'rails_helper'

RSpec.describe Congregation, type: :model do
  let(:congregation) { build_stubbed(:congregation) }

  it 'gives time and day' do
    expect(congregation.time_and_day).to eql 'Sunday 10:00 AM'
  end

  context '#full_address' do
    it 'gives full address' do
      expect(congregation.full_address).to eql '1234 Main St., Anytown, AR 12345'
    end

    it 'gives partial address' do
      congregation.state = ''
      expect(congregation.full_address).to eql '1234 Main St., Anytown 12345'
    end
  end
end
