require "rails_helper"

RSpec.describe "clusters/edit", type: :view do
  let(:cluster) {
    Cluster.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:cluster, cluster)
  end

  it "renders the edit cluster form" do
    render

    assert_select "form[action=?][method=?]", cluster_path(cluster), "post" do
      assert_select "input[name=?]", "cluster[name]"

      assert_select "textarea[name=?]", "cluster[description]"

      assert_select "textarea[name=?]", "cluster[comments]"

      assert_select "input[name=?]", "cluster[source]"
    end
  end
end
