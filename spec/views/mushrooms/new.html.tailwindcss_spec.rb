require "rails_helper"

RSpec.describe "mushrooms/new", type: :view do
  before(:each) do
    assign(:mushroom, Mushroom.new(
      mushroom_name: "MyString",
      description: "MyText",
      state: nil,
      country: nil,
      fungus_type: nil,
      mushroom_location: nil
    ))
  end

  it "renders new mushroom form" do
    render

    assert_select "form[action=?][method=?]", mushrooms_path, "post" do
      assert_select "input[name=?]", "mushroom[mushroom_name]"

      assert_select "textarea[name=?]", "mushroom[description]"

      assert_select "input[name=?]", "mushroom[state_id]"

      assert_select "input[name=?]", "mushroom[country_id]"

      assert_select "input[name=?]", "mushroom[fungus_type_id]"

      assert_select "input[name=?]", "mushroom[mushroom_location_id]"
    end
  end
end
