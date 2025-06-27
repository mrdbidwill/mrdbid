require "rails_helper"

RSpec.describe "mr_character_mushrooms/new", type: :view do
  before(:each) do
    assign(:mr_character_mushroom, MrCharacterMushroom.new(
      mr_character: nil,
      mushroom: nil,
      character_value: "MyString"
    ))
  end

  it "renders new mr_character_mushroom form" do
    render

    assert_select "form[action=?][method=?]", mr_character_mushrooms_path, "post" do
      assert_select "input[name=?]", "mr_character_mushroom[mr_character_id]"

      assert_select "input[name=?]", "mr_character_mushroom[mushroom_id]"

      assert_select "input[name=?]", "mr_character_mushroom[character_value]"
    end
  end
end
