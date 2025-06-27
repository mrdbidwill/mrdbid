require "rails_helper"

RSpec.describe "cameras/edit", type: :view do
  let(:camera) {
    Camera.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      camera_makes: nil,
      camera_models: nil,
      lens: nil
    )
  }

  before(:each) do
    assign(:camera, camera)
  end

  it "renders the edit camera form" do
    render

    assert_select "form[action=?][method=?]", camera_path(camera), "post" do
      assert_select "input[name=?]", "camera[name]"

      assert_select "textarea[name=?]", "camera[description]"

      assert_select "textarea[name=?]", "camera[comments]"

      assert_select "input[name=?]", "camera[camera_makes_id]"

      assert_select "input[name=?]", "camera[camera_models_id]"

      assert_select "input[name=?]", "camera[lens_id]"
    end
  end
end
