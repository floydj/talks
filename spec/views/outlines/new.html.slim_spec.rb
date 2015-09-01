require 'rails_helper'

RSpec.describe "outlines/new", type: :view do
  before(:each) do
    assign(:outline, Outline.new(
      :title => "MyString",
      :number => 1
    ))
  end

  it "renders new outline form" do
    render

    assert_select "form[action=?][method=?]", outlines_path, "post" do

      assert_select "input#outline_title[name=?]", "outline[title]"

      assert_select "input#outline_number[name=?]", "outline[number]"
    end
  end
end
