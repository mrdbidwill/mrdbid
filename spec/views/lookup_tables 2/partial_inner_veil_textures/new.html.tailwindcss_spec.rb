require "rails_helper"

RSpec.describe "partial_inner_veil_textures/new", type: :view do
  before(:each) do
    assign(:partial_inner_veil_texture, PartialInnerVeilTexture.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new partial_inner_veil_texture form" do
    render

    assert_select "form[action=?][method=?]", partial_inner_veil_textures_path, "post" do
      assert_select "input[name=?]", "partial_inner_veil_texture[name]"

      assert_select "textarea[name=?]", "partial_inner_veil_texture[description]"

      assert_select "textarea[name=?]", "partial_inner_veil_texture[comments]"

      assert_select "input[name=?]", "partial_inner_veil_texture[source]"
    end
  end
end
