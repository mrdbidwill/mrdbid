require "rails_helper"

RSpec.describe "tree_associations/new", type: :view do
  before(:each) do
    assign(:tree_association, TreeAssociation.new(
      mushroom: nil,
      tree: nil
    ))
  end

  it "renders new tree_association form" do
    render

    assert_select "form[action=?][method=?]", tree_associations_path, "post" do
      assert_select "input[name=?]", "tree_association[mushroom_id]"

      assert_select "input[name=?]", "tree_association[tree_id]"
    end
  end
end
