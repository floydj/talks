require 'rails_helper'

RSpec.describe "congregations/index", type: :view do
  before(:each) do
    assign(:congregations, [
      Congregation.create!(
        :name => "Name",
        :number => "Number",
        :meeting_time => "Meeting Time",
        :meeting_day => "Meeting Day",
        :kh_address => "Kh Address",
        :kh_phone => "Kh Phone"
      ),
      Congregation.create!(
        :name => "Name",
        :number => "Number",
        :meeting_time => "Meeting Time",
        :meeting_day => "Meeting Day",
        :kh_address => "Kh Address",
        :kh_phone => "Kh Phone"
      )
    ])
  end

  it "renders a list of congregations" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => "Meeting Time".to_s, :count => 2
    assert_select "tr>td", :text => "Meeting Day".to_s, :count => 2
    assert_select "tr>td", :text => "Kh Address".to_s, :count => 2
    assert_select "tr>td", :text => "Kh Phone".to_s, :count => 2
  end
end
