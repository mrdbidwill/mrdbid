require "rails_helper"

RSpec.describe "partial_inner_veil_annular_ring_positions/new", type: :view do
  before(:each) do
    assign(:partial_inner_veil_annular_ring_position, PartialInnerVeilAnnularRingPosition.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new partial_inner_veil_annular_ring_position form" do
    render

    assert_select "form[action=?][method=?]", partial_inner_veil_annular_ring_positions_path, "post" do
      assert_select "input[name=?]", "partial_inner_veil_annular_ring_position[name]"

      assert_select "textarea[name=?]", "partial_inner_veil_annular_ring_position[description]"

      assert_select "textarea[name=?]", "partial_inner_veil_annular_ring_position[comments]"

      assert_select "input[name=?]", "partial_inner_veil_annular_ring_position[source]"
    end
  end
end
