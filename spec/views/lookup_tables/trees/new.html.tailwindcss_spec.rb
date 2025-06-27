require "rails_helper"

RSpec.describe "trees/new", type: :view do
  before(:each) do
    assign(:tree, Tree.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new tree form" do
    render

    assert_select "form[action=?][method=?]", trees_path, "post" do
      assert_select "input[name=?]", "tree[name]"

      assert_select "textarea[name=?]", "tree[description]"

      assert_select "textarea[name=?]", "tree[comments]"

      assert_select "input[name=?]", "tree[source]"
    end
  end
end
