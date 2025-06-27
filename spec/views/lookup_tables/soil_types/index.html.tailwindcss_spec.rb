require "rails_helper"

RSpec.describe "soil_types/index", type: :view do
  before(:each) do
    assign(:soil_types, [
      SoilType.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      ),
      SoilType.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      )
    ])
  end

  it "renders a list of soil_types" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
