require "rails_helper"

RSpec.describe "stem_textures/index", type: :view do
  before(:each) do
    assign(:stem_textures, [
      StemTexture.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      ),
      StemTexture.create!(
        name: "Name",
        description: "MyText",
        comments: "MyText",
        source: nil
      )
    ])
  end

  it "renders a list of stem_textures" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new("MyText"), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
