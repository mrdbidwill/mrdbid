require "rails_helper"

RSpec.describe "tree_associations/edit", type: :view do
  let(:tree_association) {
    TreeAssociation.create!(
      mushroom: nil,
      tree: nil
    )
  }

  before(:each) do
    assign(:tree_association, tree_association)
  end

  it "renders the edit tree_association form" do
    render

    assert_select "form[action=?][method=?]", tree_association_path(tree_association), "post" do
      assert_select "input[name=?]", "tree_association[mushroom_id]"

      assert_select "input[name=?]", "tree_association[tree_id]"
    end
  end
end
