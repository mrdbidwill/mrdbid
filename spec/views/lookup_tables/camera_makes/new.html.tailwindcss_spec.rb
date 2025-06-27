require "rails_helper"

RSpec.describe "camera_makes/new", type: :view do
  before(:each) do
    assign(:camera_make, CameraMake.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new camera_make form" do
    render

    assert_select "form[action=?][method=?]", camera_makes_path, "post" do
      assert_select "input[name=?]", "camera_make[name]"

      assert_select "textarea[name=?]", "camera_make[description]"

      assert_select "textarea[name=?]", "camera_make[comments]"

      assert_select "input[name=?]", "camera_make[source]"
    end
  end
end
