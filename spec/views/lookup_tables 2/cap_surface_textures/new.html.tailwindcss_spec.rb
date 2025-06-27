require "rails_helper"

RSpec.describe "cap_surface_textures/new", type: :view do
  before(:each) do
    assign(:cap_surface_texture, CapSurfaceTexture.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new cap_surface_texture form" do
    render

    assert_select "form[action=?][method=?]", cap_surface_textures_path, "post" do
      assert_select "input[name=?]", "cap_surface_texture[name]"

      assert_select "textarea[name=?]", "cap_surface_texture[description]"

      assert_select "textarea[name=?]", "cap_surface_texture[comments]"

      assert_select "input[name=?]", "cap_surface_texture[source]"
    end
  end
end
