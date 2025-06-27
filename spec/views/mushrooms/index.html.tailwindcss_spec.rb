require "rails_helper"

RSpec.describe "mushrooms/index", type: :view do
  before(:each) do
    assign(:mushrooms, [
      Mushroom.create!(
        mushroom_name: "Mushroom Name",
        description: "MyText",
        state: nil,
        country: nil,
        fungus_type: nil,
        mushroom_location: nil
      ),
      Mushroom.create!(
        mushroom_name: "Mushroom Name",
        description: "MyText",
        state: nil,
        country: nil,
        fungus_type: nil,
        mushroom_location: nil
      )
    ])
  end

  it "renders a list of mushrooms" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Mushroom Name"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
