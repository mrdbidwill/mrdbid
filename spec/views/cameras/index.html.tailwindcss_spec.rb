require "rails_helper"

RSpec.describe "cameras/index", type: :view do
  before(:each) do
    assign(:cameras, [
      Camera.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        camera_makes: nil,
        camera_models: nil,
        lens: nil
      ),
      Camera.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        camera_makes: nil,
        camera_models: nil,
        lens: nil
      )
    ])
  end

  it "renders a list of cameras" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
