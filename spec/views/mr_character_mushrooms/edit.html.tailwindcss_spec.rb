require "rails_helper"

RSpec.describe "mr_character_mushrooms/edit", type: :view do
  let(:mr_character_mushroom) {
    MrCharacterMushroom.create!(
      mr_character: nil,
      mushroom: nil,
      character_value: "MyString"
    )
  }

  before(:each) do
    assign(:mr_character_mushroom, mr_character_mushroom)
  end

  it "renders the edit mr_character_mushroom form" do
    render

    assert_select "form[action=?][method=?]", mr_character_mushroom_path(mr_character_mushroom), "post" do
      assert_select "input[name=?]", "mr_character_mushroom[mr_character_id]"

      assert_select "input[name=?]", "mr_character_mushroom[mushroom_id]"

      assert_select "input[name=?]", "mr_character_mushroom[character_value]"
    end
  end
end
