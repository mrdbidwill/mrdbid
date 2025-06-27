require "rails_helper"

RSpec.describe "cameras/new", type: :view do
  before(:each) do
    assign(:camera, Camera.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      camera_makes: nil,
      camera_models: nil,
      lens: nil
    ))
  end

  it "renders new camera form" do
    render

    assert_select "form[action=?][method=?]", cameras_path, "post" do
      assert_select "input[name=?]", "camera[name]"

      assert_select "textarea[name=?]", "camera[description]"

      assert_select "textarea[name=?]", "camera[comments]"

      assert_select "input[name=?]", "camera[camera_makes_id]"

      assert_select "input[name=?]", "camera[camera_models_id]"

      assert_select "input[name=?]", "camera[lens_id]"
    end
  end
end
