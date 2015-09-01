require 'rails_helper'

RSpec.describe "outlines/show", type: :view do
  before(:each) do
    @outline = assign(:outline, Outline.create!(
      :title => "Title",
      :number => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/1/)
  end
end
