require "rails_helper"

RSpec.describe "preservation_methods/new", type: :view do
  before(:each) do
    assign(:preservation_method, PreservationMethod.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new preservation_method form" do
    render

    assert_select "form[action=?][method=?]", preservation_methods_path, "post" do
      assert_select "input[name=?]", "preservation_method[name]"

      assert_select "textarea[name=?]", "preservation_method[description]"

      assert_select "textarea[name=?]", "preservation_method[comments]"

      assert_select "input[name=?]", "preservation_method[source]"
    end
  end
end
