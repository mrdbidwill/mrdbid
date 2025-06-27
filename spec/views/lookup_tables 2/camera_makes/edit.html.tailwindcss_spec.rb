require "rails_helper"

RSpec.describe "camera_makes/edit", type: :view do
  let(:camera_make) {
    CameraMake.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:camera_make, camera_make)
  end

  it "renders the edit camera_make form" do
    render

    assert_select "form[action=?][method=?]", camera_make_path(camera_make), "post" do
      assert_select "input[name=?]", "camera_make[name]"

      assert_select "textarea[name=?]", "camera_make[description]"

      assert_select "textarea[name=?]", "camera_make[comments]"

      assert_select "input[name=?]", "camera_make[source]"
    end
  end
end
