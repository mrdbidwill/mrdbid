require "rails_helper"

RSpec.describe "cap_context_flesh_textures/new", type: :view do
  before(:each) do
    assign(:cap_context_flesh_texture, CapContextFleshTexture.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new cap_context_flesh_texture form" do
    render

    assert_select "form[action=?][method=?]", cap_context_flesh_textures_path, "post" do
      assert_select "input[name=?]", "cap_context_flesh_texture[name]"

      assert_select "textarea[name=?]", "cap_context_flesh_texture[description]"

      assert_select "textarea[name=?]", "cap_context_flesh_texture[comments]"

      assert_select "input[name=?]", "cap_context_flesh_texture[source]"
    end
  end
end
