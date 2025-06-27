require "rails_helper"

RSpec.describe "stem_textures/edit", type: :view do
  let(:stem_texture) {
    StemTexture.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:stem_texture, stem_texture)
  end

  it "renders the edit stem_texture form" do
    render

    assert_select "form[action=?][method=?]", stem_texture_path(stem_texture), "post" do
      assert_select "input[name=?]", "stem_texture[name]"

      assert_select "textarea[name=?]", "stem_texture[description]"

      assert_select "textarea[name=?]", "stem_texture[comments]"

      assert_select "input[name=?]", "stem_texture[source]"
    end
  end
end
