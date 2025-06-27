require "rails_helper"

RSpec.describe "clusters/new", type: :view do
  before(:each) do
    assign(:cluster, Cluster.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new cluster form" do
    render

    assert_select "form[action=?][method=?]", clusters_path, "post" do
      assert_select "input[name=?]", "cluster[name]"

      assert_select "textarea[name=?]", "cluster[description]"

      assert_select "textarea[name=?]", "cluster[comments]"

      assert_select "input[name=?]", "cluster[source]"
    end
  end
end
