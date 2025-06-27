require "rails_helper"

RSpec.describe "universal_outer_veil_textures/show", type: :view do
  before(:each) do
    assign(:universal_outer_veil_texture, UniversalOuterVeilTexture.create!(
      name: "Name",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
