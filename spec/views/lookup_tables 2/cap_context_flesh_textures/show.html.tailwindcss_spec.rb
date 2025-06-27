require "rails_helper"

RSpec.describe "cap_context_flesh_textures/show", type: :view do
  before(:each) do
    assign(:cap_context_flesh_texture, CapContextFleshTexture.create!(
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
