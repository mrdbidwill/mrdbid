require "rails_helper"

RSpec.describe "mycelium_textures/new", type: :view do
  before(:each) do
    assign(:mycelium_texture, MyceliumTexture.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new mycelium_texture form" do
    render

    assert_select "form[action=?][method=?]", mycelium_textures_path, "post" do
      assert_select "input[name=?]", "mycelium_texture[name]"

      assert_select "textarea[name=?]", "mycelium_texture[description]"

      assert_select "textarea[name=?]", "mycelium_texture[comments]"

      assert_select "input[name=?]", "mycelium_texture[source]"
    end
  end
end
