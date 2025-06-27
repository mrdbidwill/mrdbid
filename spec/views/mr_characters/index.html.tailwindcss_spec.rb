require "rails_helper"

RSpec.describe "mr_characters/index", type: :view do
  before(:each) do
    assign(:mr_characters, [
      MrCharacter.create!(
        name: "Name",
        display_options: nil,
        parts: nil,
        source: nil
      ),
      MrCharacter.create!(
        name: "Name",
        display_options: nil,
        parts: nil,
        source: nil
      )
    ])
  end

  it "renders a list of mr_characters" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new("Name"), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
