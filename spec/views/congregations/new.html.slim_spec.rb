require 'rails_helper'

RSpec.describe "congregations/new", type: :view do
  before(:each) do
    assign(:congregation, Congregation.new(
      :name => "MyString",
      :number => "MyString",
      :meeting_time => "MyString",
      :meeting_day => "MyString",
      :kh_address => "MyString",
      :kh_phone => "MyString"
    ))
  end

  it "renders new congregation form" do
    render

    assert_select "form[action=?][method=?]", congregations_path, "post" do

      assert_select "input#congregation_name[name=?]", "congregation[name]"

      assert_select "input#congregation_number[name=?]", "congregation[number]"

      assert_select "input#congregation_meeting_time[name=?]", "congregation[meeting_time]"

      assert_select "input#congregation_meeting_day[name=?]", "congregation[meeting_day]"

      assert_select "input#congregation_kh_address[name=?]", "congregation[kh_address]"

      assert_select "input#congregation_kh_phone[name=?]", "congregation[kh_phone]"
    end
  end
end
