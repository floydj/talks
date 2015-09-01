require 'rails_helper'

RSpec.describe "congregations/edit", type: :view do
  before(:each) do
    @congregation = assign(:congregation, Congregation.create!(
      :name => "MyString",
      :number => "MyString",
      :meeting_time => "MyString",
      :meeting_day => "MyString",
      :kh_address => "MyString",
      :kh_phone => "MyString"
    ))
  end

  it "renders the edit congregation form" do
    render

    assert_select "form[action=?][method=?]", congregation_path(@congregation), "post" do

      assert_select "input#congregation_name[name=?]", "congregation[name]"

      assert_select "input#congregation_number[name=?]", "congregation[number]"

      assert_select "input#congregation_meeting_time[name=?]", "congregation[meeting_time]"

      assert_select "input#congregation_meeting_day[name=?]", "congregation[meeting_day]"

      assert_select "input#congregation_kh_address[name=?]", "congregation[kh_address]"

      assert_select "input#congregation_kh_phone[name=?]", "congregation[kh_phone]"
    end
  end
end
