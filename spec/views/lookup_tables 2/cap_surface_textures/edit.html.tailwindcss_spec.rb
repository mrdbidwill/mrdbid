require "rails_helper"

RSpec.describe "cap_surface_textures/edit", type: :view do
  let(:cap_surface_texture) {
    CapSurfaceTexture.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:cap_surface_texture, cap_surface_texture)
  end

  it "renders the edit cap_surface_texture form" do
    render

    assert_select "form[action=?][method=?]", cap_surface_texture_path(cap_surface_texture), "post" do
      assert_select "input[name=?]", "cap_surface_texture[name]"

      assert_select "textarea[name=?]", "cap_surface_texture[description]"

      assert_select "textarea[name=?]", "cap_surface_texture[comments]"

      assert_select "input[name=?]", "cap_surface_texture[source]"
    end
  end
end
