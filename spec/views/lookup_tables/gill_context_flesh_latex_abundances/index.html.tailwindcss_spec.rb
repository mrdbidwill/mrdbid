require "rails_helper"

RSpec.describe "gill_context_flesh_latex_abundances/index", type: :view do
  before(:each) do
    assign(:gill_context_flesh_latex_abundances, [
      GillContextFleshLatexAbundance.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      ),
      GillContextFleshLatexAbundance.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      )
    ])
  end

  it "renders a list of gill_context_flesh_latex_abundances" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
