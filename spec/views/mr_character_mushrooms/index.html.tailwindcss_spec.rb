require "rails_helper"

RSpec.describe "mr_character_mushrooms/index", type: :view do
  before(:each) do
    assign(:mr_character_mushrooms, [
      MrCharacterMushroom.create!(
        mr_character: nil,
        mushroom: nil,
        character_value: "Character Value"
      ),
      MrCharacterMushroom.create!(
        mr_character: nil,
        mushroom: nil,
        character_value: "Character Value"
      )
    ])
  end

  it "renders a list of mr_character_mushrooms" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Character Value"), count: 2
  end
end
