require "rails_helper"

RSpec.describe "mr_characters/new", type: :view do
  before(:each) do
    assign(:mr_character, MrCharacter.new(
      name: "MyString",
      display_options: nil,
      parts: nil,
      source: nil
    ))
  end

  it "renders new mr_character form" do
    render

    assert_select "form[action=?][method=?]", mr_characters_path, "post" do
      assert_select "input[name=?]", "mr_character[name]"

      assert_select "input[name=?]", "mr_character[display_options_id]"

      assert_select "input[name=?]", "mr_character[parts_id]"

      assert_select "input[name=?]", "mr_character[source]"
    end
  end
end
