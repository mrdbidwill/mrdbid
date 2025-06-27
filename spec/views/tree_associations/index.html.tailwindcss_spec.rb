require "rails_helper"

RSpec.describe "tree_associations/index", type: :view do
  before(:each) do
    assign(:tree_associations, [
      TreeAssociation.create!(
        mushroom: nil,
        tree: nil
      ),
      TreeAssociation.create!(
        mushroom: nil,
        tree: nil
      )
    ])
  end

  it "renders a list of tree_associations" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
