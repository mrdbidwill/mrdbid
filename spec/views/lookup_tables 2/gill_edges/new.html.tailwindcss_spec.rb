require "rails_helper"

RSpec.describe "gill_edges/new", type: :view do
  before(:each) do
    assign(:gill_edge, GillEdge.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new gill_edge form" do
    render

    assert_select "form[action=?][method=?]", gill_edges_path, "post" do
      assert_select "input[name=?]", "gill_edge[name]"

      assert_select "textarea[name=?]", "gill_edge[description]"

      assert_select "textarea[name=?]", "gill_edge[comments]"

      assert_select "input[name=?]", "gill_edge[source]"
    end
  end
end
