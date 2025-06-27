require "rails_helper"

RSpec.describe "camera_models/new", type: :view do
  before(:each) do
    assign(:camera_model, CameraModel.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new camera_model form" do
    render

    assert_select "form[action=?][method=?]", camera_models_path, "post" do
      assert_select "input[name=?]", "camera_model[name]"

      assert_select "textarea[name=?]", "camera_model[description]"

      assert_select "textarea[name=?]", "camera_model[comments]"

      assert_select "input[name=?]", "camera_model[source]"
    end
  end
end
