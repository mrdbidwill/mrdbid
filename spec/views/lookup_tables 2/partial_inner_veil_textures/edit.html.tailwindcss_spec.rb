require "rails_helper"

RSpec.describe "partial_inner_veil_textures/edit", type: :view do
  let(:partial_inner_veil_texture) {
    PartialInnerVeilTexture.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:partial_inner_veil_texture, partial_inner_veil_texture)
  end

  it "renders the edit partial_inner_veil_texture form" do
    render

    assert_select "form[action=?][method=?]", partial_inner_veil_texture_path(partial_inner_veil_texture), "post" do
      assert_select "input[name=?]", "partial_inner_veil_texture[name]"

      assert_select "textarea[name=?]", "partial_inner_veil_texture[description]"

      assert_select "textarea[name=?]", "partial_inner_veil_texture[comments]"

      assert_select "input[name=?]", "partial_inner_veil_texture[source]"
    end
  end
end
