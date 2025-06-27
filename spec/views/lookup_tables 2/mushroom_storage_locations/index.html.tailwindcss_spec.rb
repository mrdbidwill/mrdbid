require "rails_helper"

RSpec.describe "mushroom_storage_locations/index", type: :view do
  before(:each) do
    assign(:mushroom_storage_locations, [
      MushroomStorageLocation.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      ),
      MushroomStorageLocation.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      )
    ])
  end

  it "renders a list of mushroom_storage_locations" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
