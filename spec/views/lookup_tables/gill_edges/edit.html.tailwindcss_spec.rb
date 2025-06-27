require "rails_helper"

RSpec.describe "gill_edges/edit", type: :view do
  let(:gill_edge) {
    GillEdge.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:gill_edge, gill_edge)
  end

  it "renders the edit gill_edge form" do
    render

    assert_select "form[action=?][method=?]", gill_edge_path(gill_edge), "post" do
      assert_select "input[name=?]", "gill_edge[name]"

      assert_select "textarea[name=?]", "gill_edge[description]"

      assert_select "textarea[name=?]", "gill_edge[comments]"

      assert_select "input[name=?]", "gill_edge[source]"
    end
  end
end
