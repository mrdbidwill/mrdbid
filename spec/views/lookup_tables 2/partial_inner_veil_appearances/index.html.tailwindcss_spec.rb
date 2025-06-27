require "rails_helper"

RSpec.describe "partial_inner_veil_appearances/index", type: :view do
  before(:each) do
    assign(:partial_inner_veil_appearances, [
      PartialInnerVeilAppearance.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      ),
      PartialInnerVeilAppearance.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      )
    ])
  end

  it "renders a list of partial_inner_veil_appearances" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
