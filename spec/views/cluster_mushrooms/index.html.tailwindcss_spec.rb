require "rails_helper"

RSpec.describe "cluster_mushrooms/index", type: :view do
  before(:each) do
    assign(:cluster_mushrooms, [
      ClusterMushroom.create!(
        cluster: nil,
        mushroom: nil
      ),
      ClusterMushroom.create!(
        cluster: nil,
        mushroom: nil
      )
    ])
  end

  it "renders a list of cluster_mushrooms" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
