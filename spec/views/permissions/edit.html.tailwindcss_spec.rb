require "rails_helper"

RSpec.describe "permissions/edit", type: :view do
  let(:permission) {
    Permission.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:permission, permission)
  end

  it "renders the edit permission form" do
    render

    assert_select "form[action=?][method=?]", permission_path(permission), "post" do
      assert_select "input[name=?]", "permission[name]"

      assert_select "textarea[name=?]", "permission[description]"

      assert_select "textarea[name=?]", "permission[comments]"

      assert_select "input[name=?]", "permission[source]"
    end
  end
end
