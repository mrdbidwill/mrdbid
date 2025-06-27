require "rails_helper"

RSpec.describe "partial_inner_veil_fates/index", type: :view do
  before(:each) do
    assign(:partial_inner_veil_fates, [
      PartialInnerVeilFate.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      ),
      PartialInnerVeilFate.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      )
    ])
  end

  it "renders a list of partial_inner_veil_fates" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
