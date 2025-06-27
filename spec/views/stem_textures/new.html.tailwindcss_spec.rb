require "rails_helper"

RSpec.describe "stem_textures/new", type: :view do
  before(:each) do
    assign(:stem_texture, StemTexture.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new stem_texture form" do
    render

    assert_select "form[action=?][method=?]", stem_textures_path, "post" do
      assert_select "input[name=?]", "stem_texture[name]"

      assert_select "textarea[name=?]", "stem_texture[description]"

      assert_select "textarea[name=?]", "stem_texture[comments]"

      assert_select "input[name=?]", "stem_texture[source]"
    end
  end
end
