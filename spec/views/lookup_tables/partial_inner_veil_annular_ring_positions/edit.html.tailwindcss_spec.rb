require "rails_helper"

RSpec.describe "partial_inner_veil_annular_ring_positions/edit", type: :view do
  let(:partial_inner_veil_annular_ring_position) {
    PartialInnerVeilAnnularRingPosition.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:partial_inner_veil_annular_ring_position, partial_inner_veil_annular_ring_position)
  end

  it "renders the edit partial_inner_veil_annular_ring_position form" do
    render

    assert_select "form[action=?][method=?]", partial_inner_veil_annular_ring_position_path(partial_inner_veil_annular_ring_position), "post" do
      assert_select "input[name=?]", "partial_inner_veil_annular_ring_position[name]"

      assert_select "textarea[name=?]", "partial_inner_veil_annular_ring_position[description]"

      assert_select "textarea[name=?]", "partial_inner_veil_annular_ring_position[comments]"

      assert_select "input[name=?]", "partial_inner_veil_annular_ring_position[source]"
    end
  end
end
