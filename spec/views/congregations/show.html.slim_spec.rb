require 'rails_helper'

RSpec.describe "congregations/show", type: :view do
  before(:each) do
    @congregation = assign(:congregation, Congregation.create!(
      :name => "Name",
      :number => "Number",
      :meeting_time => "Meeting Time",
      :meeting_day => "Meeting Day",
      :kh_address => "Kh Address",
      :kh_phone => "Kh Phone"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Number/)
    expect(rendered).to match(/Meeting Time/)
    expect(rendered).to match(/Meeting Day/)
    expect(rendered).to match(/Kh Address/)
    expect(rendered).to match(/Kh Phone/)
  end
end
