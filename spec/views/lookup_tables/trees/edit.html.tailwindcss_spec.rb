require "rails_helper"

RSpec.describe "trees/edit", type: :view do
  let(:tree) {
    Tree.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:tree, tree)
  end

  it "renders the edit tree form" do
    render

    assert_select "form[action=?][method=?]", tree_path(tree), "post" do
      assert_select "input[name=?]", "tree[name]"

      assert_select "textarea[name=?]", "tree[description]"

      assert_select "textarea[name=?]", "tree[comments]"

      assert_select "input[name=?]", "tree[source]"
    end
  end
end
