require "rails_helper"

RSpec.describe "universal_outer_veil_textures/new", type: :view do
  before(:each) do
    assign(:universal_outer_veil_texture, UniversalOuterVeilTexture.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new universal_outer_veil_texture form" do
    render

    assert_select "form[action=?][method=?]", universal_outer_veil_textures_path, "post" do
      assert_select "input[name=?]", "universal_outer_veil_texture[name]"

      assert_select "textarea[name=?]", "universal_outer_veil_texture[description]"

      assert_select "textarea[name=?]", "universal_outer_veil_texture[comments]"

      assert_select "input[name=?]", "universal_outer_veil_texture[source]"
    end
  end
end
