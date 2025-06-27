require "rails_helper"

RSpec.describe "cluster_mushrooms/new", type: :view do
  before(:each) do
    assign(:cluster_mushroom, ClusterMushroom.new(
      cluster: nil,
      mushroom: nil
    ))
  end

  it "renders new cluster_mushroom form" do
    render

    assert_select "form[action=?][method=?]", cluster_mushrooms_path, "post" do
      assert_select "input[name=?]", "cluster_mushroom[cluster_id]"

      assert_select "input[name=?]", "cluster_mushroom[mushroom_id]"
    end
  end
end
