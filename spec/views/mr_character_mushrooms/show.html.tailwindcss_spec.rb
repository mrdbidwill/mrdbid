require "rails_helper"

RSpec.describe "mr_character_mushrooms/show", type: :view do
  before(:each) do
    assign(:mr_character_mushroom, MrCharacterMushroom.create!(
      mr_character: nil,
      mushroom: nil,
      character_value: "Character Value"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Character Value/)
  end
end
