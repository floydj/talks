require 'rails_helper'

RSpec.describe "outlines/edit", type: :view do
  before(:each) do
    @outline = assign(:outline, Outline.create!(
      :title => "MyString",
      :number => 1
    ))
  end

  it "renders the edit outline form" do
    render

    assert_select "form[action=?][method=?]", outline_path(@outline), "post" do

      assert_select "input#outline_title[name=?]", "outline[title]"

      assert_select "input#outline_number[name=?]", "outline[number]"
    end
  end
end
