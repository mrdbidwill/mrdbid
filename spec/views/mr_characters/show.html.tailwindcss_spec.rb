require "rails_helper"

RSpec.describe "mr_characters/show", type: :view do
  before(:each) do
    assign(:mr_character, MrCharacter.create!(
      name: "Name",
      display_options: nil,
      parts: nil,
      source: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
