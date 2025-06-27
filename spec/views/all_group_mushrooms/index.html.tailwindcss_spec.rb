require "rails_helper"

RSpec.describe "all_group_mushrooms/index", type: :view do
  before(:each) do
    assign(:all_group_mushrooms, [
      AllGroupMushroom.create!(
        all_group: nil,
        mushroom: nil
      ),
      AllGroupMushroom.create!(
        all_group: nil,
        mushroom: nil
      )
    ])
  end

  it "renders a list of all_group_mushrooms" do
    render
    cell_selector = "div>p"
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
