require "rails_helper"

RSpec.describe "rhizomorph_textures/edit", type: :view do
  let(:rhizomorph_texture) {
    RhizomorphTexture.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:rhizomorph_texture, rhizomorph_texture)
  end

  it "renders the edit rhizomorph_texture form" do
    render

    assert_select "form[action=?][method=?]", rhizomorph_texture_path(rhizomorph_texture), "post" do
      assert_select "input[name=?]", "rhizomorph_texture[name]"

      assert_select "textarea[name=?]", "rhizomorph_texture[description]"

      assert_select "textarea[name=?]", "rhizomorph_texture[comments]"

      assert_select "input[name=?]", "rhizomorph_texture[source]"
    end
  end
end
