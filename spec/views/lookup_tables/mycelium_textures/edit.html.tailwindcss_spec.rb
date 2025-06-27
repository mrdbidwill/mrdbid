require "rails_helper"

RSpec.describe "mycelium_textures/edit", type: :view do
  let(:mycelium_texture) {
    MyceliumTexture.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:mycelium_texture, mycelium_texture)
  end

  it "renders the edit mycelium_texture form" do
    render

    assert_select "form[action=?][method=?]", mycelium_texture_path(mycelium_texture), "post" do
      assert_select "input[name=?]", "mycelium_texture[name]"

      assert_select "textarea[name=?]", "mycelium_texture[description]"

      assert_select "textarea[name=?]", "mycelium_texture[comments]"

      assert_select "input[name=?]", "mycelium_texture[source]"
    end
  end
end
