require 'rails_helper'

RSpec.describe "outlines/index", type: :view do
  before(:each) do
    assign(:outlines, [
      Outline.create!(
        :title => "Title",
        :number => 1
      ),
      Outline.create!(
        :title => "Title",
        :number => 1
      )
    ])
  end

  it "renders a list of outlines" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
