require "rails_helper"

RSpec.describe "display_options/new", type: :view do
  before(:each) do
    assign(:display_option, DisplayOption.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new display_option form" do
    render

    assert_select "form[action=?][method=?]", display_options_path, "post" do
      assert_select "input[name=?]", "display_option[name]"

      assert_select "textarea[name=?]", "display_option[description]"

      assert_select "textarea[name=?]", "display_option[comments]"

      assert_select "input[name=?]", "display_option[source]"
    end
  end
end
