require "rails_helper"

RSpec.describe "annulus_positions/edit", type: :view do
  let(:annulus_position) {
    AnnulusPosition.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:annulus_position, annulus_position)
  end

  it "renders the edit annulus_position form" do
    render

    assert_select "form[action=?][method=?]", annulus_position_path(annulus_position), "post" do
      assert_select "input[name=?]", "annulus_position[name]"

      assert_select "textarea[name=?]", "annulus_position[description]"

      assert_select "textarea[name=?]", "annulus_position[comments]"

      assert_select "input[name=?]", "annulus_position[source]"
    end
  end
end
