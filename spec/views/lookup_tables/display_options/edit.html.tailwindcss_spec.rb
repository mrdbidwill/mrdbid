require "rails_helper"

RSpec.describe "display_options/edit", type: :view do
  let(:display_option) {
    DisplayOption.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:display_option, display_option)
  end

  it "renders the edit display_option form" do
    render

    assert_select "form[action=?][method=?]", display_option_path(display_option), "post" do
      assert_select "input[name=?]", "display_option[name]"

      assert_select "textarea[name=?]", "display_option[description]"

      assert_select "textarea[name=?]", "display_option[comments]"

      assert_select "input[name=?]", "display_option[source]"
    end
  end
end
