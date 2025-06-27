require "rails_helper"

RSpec.describe "cluster_mushrooms/edit", type: :view do
  let(:cluster_mushroom) {
    ClusterMushroom.create!(
      cluster: nil,
      mushroom: nil
    )
  }

  before(:each) do
    assign(:cluster_mushroom, cluster_mushroom)
  end

  it "renders the edit cluster_mushroom form" do
    render

    assert_select "form[action=?][method=?]", cluster_mushroom_path(cluster_mushroom), "post" do
      assert_select "input[name=?]", "cluster_mushroom[cluster_id]"

      assert_select "input[name=?]", "cluster_mushroom[mushroom_id]"
    end
  end
end
