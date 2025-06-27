require "rails_helper"

RSpec.describe "annulus_positions/new", type: :view do
  before(:each) do
    assign(:annulus_position, AnnulusPosition.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new annulus_position form" do
    render

    assert_select "form[action=?][method=?]", annulus_positions_path, "post" do
      assert_select "input[name=?]", "annulus_position[name]"

      assert_select "textarea[name=?]", "annulus_position[description]"

      assert_select "textarea[name=?]", "annulus_position[comments]"

      assert_select "input[name=?]", "annulus_position[source]"
    end
  end
end
