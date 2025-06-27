require "rails_helper"

RSpec.describe "cap_context_flesh_textures/edit", type: :view do
  let(:cap_context_flesh_texture) {
    CapContextFleshTexture.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:cap_context_flesh_texture, cap_context_flesh_texture)
  end

  it "renders the edit cap_context_flesh_texture form" do
    render

    assert_select "form[action=?][method=?]", cap_context_flesh_texture_path(cap_context_flesh_texture), "post" do
      assert_select "input[name=?]", "cap_context_flesh_texture[name]"

      assert_select "textarea[name=?]", "cap_context_flesh_texture[description]"

      assert_select "textarea[name=?]", "cap_context_flesh_texture[comments]"

      assert_select "input[name=?]", "cap_context_flesh_texture[source]"
    end
  end
end
