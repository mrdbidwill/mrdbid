require "rails_helper"

RSpec.describe "tree_associations/show", type: :view do
  before(:each) do
    assign(:tree_association, TreeAssociation.create!(
      mushroom: nil,
      tree: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
