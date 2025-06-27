require "rails_helper"

RSpec.describe "cluster_mushrooms/show", type: :view do
  before(:each) do
    assign(:cluster_mushroom, ClusterMushroom.create!(
      cluster: nil,
      mushroom: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
