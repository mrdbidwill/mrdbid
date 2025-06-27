require "rails_helper"

RSpec.describe "rhizomorph_textures/new", type: :view do
  before(:each) do
    assign(:rhizomorph_texture, RhizomorphTexture.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new rhizomorph_texture form" do
    render

    assert_select "form[action=?][method=?]", rhizomorph_textures_path, "post" do
      assert_select "input[name=?]", "rhizomorph_texture[name]"

      assert_select "textarea[name=?]", "rhizomorph_texture[description]"

      assert_select "textarea[name=?]", "rhizomorph_texture[comments]"

      assert_select "input[name=?]", "rhizomorph_texture[source]"
    end
  end
end
