require 'rails_helper'

RSpec.describe Brother, type: :model do

  context "#full_name" do
    let(:bro) { Brother.new(first_name: 'John', last_name: 'Doe',
                            congregation_id: 1) }

    it 'provides full_name' do
      expect(bro.full_name).to eql 'John Doe'
    end

    it 'provides full name reversed' do
      expect(bro.full_name(reverse: true)).to eql 'Doe, John'
    end
  end
end
