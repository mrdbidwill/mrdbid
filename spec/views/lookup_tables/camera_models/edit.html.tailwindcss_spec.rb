require "rails_helper"

RSpec.describe "camera_models/edit", type: :view do
  let(:camera_model) {
    CameraModel.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:camera_model, camera_model)
  end

  it "renders the edit camera_model form" do
    render

    assert_select "form[action=?][method=?]", camera_model_path(camera_model), "post" do
      assert_select "input[name=?]", "camera_model[name]"

      assert_select "textarea[name=?]", "camera_model[description]"

      assert_select "textarea[name=?]", "camera_model[comments]"

      assert_select "input[name=?]", "camera_model[source]"
    end
  end
end
