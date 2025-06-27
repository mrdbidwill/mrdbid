require "rails_helper"

RSpec.describe "all_group_mushrooms/new", type: :view do
  before(:each) do
    assign(:all_group_mushroom, AllGroupMushroom.new(
      all_group: nil,
      mushroom: nil
    ))
  end

  it "renders new all_group_mushroom form" do
    render

    assert_select "form[action=?][method=?]", all_group_mushrooms_path, "post" do
      assert_select "input[name=?]", "all_group_mushroom[all_group_id]"

      assert_select "input[name=?]", "all_group_mushroom[mushroom_id]"
    end
  end
end
