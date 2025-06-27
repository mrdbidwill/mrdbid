require "rails_helper"

RSpec.describe "all_group_mushrooms/edit", type: :view do
  let(:all_group_mushroom) {
    AllGroupMushroom.create!(
      all_group: nil,
      mushroom: nil
    )
  }

  before(:each) do
    assign(:all_group_mushroom, all_group_mushroom)
  end

  it "renders the edit all_group_mushroom form" do
    render

    assert_select "form[action=?][method=?]", all_group_mushroom_path(all_group_mushroom), "post" do
      assert_select "input[name=?]", "all_group_mushroom[all_group_id]"

      assert_select "input[name=?]", "all_group_mushroom[mushroom_id]"
    end
  end
end
