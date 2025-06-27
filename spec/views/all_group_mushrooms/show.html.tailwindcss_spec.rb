require "rails_helper"

RSpec.describe "all_group_mushrooms/show", type: :view do
  before(:each) do
    assign(:all_group_mushroom, AllGroupMushroom.create!(
      all_group: nil,
      mushroom: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
