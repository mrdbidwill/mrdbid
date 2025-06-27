require "rails_helper"

RSpec.describe "all_groups/index", type: :view do
  before(:each) do
    assign(:all_groups, [
      AllGroup.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      ),
      AllGroup.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      )
    ])
  end

  it "renders a list of all_groups" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
