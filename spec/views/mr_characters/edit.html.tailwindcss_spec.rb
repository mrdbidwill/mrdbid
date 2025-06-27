require "rails_helper"

RSpec.describe "mr_characters/edit", type: :view do
  let(:mr_character) {
    MrCharacter.create!(
      name: "MyString",
      display_options: nil,
      parts: nil,
      source: nil
    )
  }

  before(:each) do
    assign(:mr_character, mr_character)
  end

  it "renders the edit mr_character form" do
    render

    assert_select "form[action=?][method=?]", mr_character_path(mr_character), "post" do
      assert_select "input[name=?]", "mr_character[name]"

      assert_select "input[name=?]", "mr_character[display_options_id]"

      assert_select "input[name=?]", "mr_character[parts_id]"

      assert_select "input[name=?]", "mr_character[source]"
    end
  end
end
