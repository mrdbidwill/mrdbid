require "rails_helper"

RSpec.describe "lens/index", type: :view do
  before(:each) do
    assign(:lens, [
      Lens.create!(
        make: "Make",
        model: "Model",
        description: "MyText",
        comments: "MyText"
      ),
      Lens.create!(
        make: "Make",
        model: "Model",
        description: "MyText",
        comments: "MyText"
      )
    ])
  end

  it "renders a list of lens" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Make"), count: 2
    assert_select cell_selector, text: Regexp.new("Model"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
  end
end
