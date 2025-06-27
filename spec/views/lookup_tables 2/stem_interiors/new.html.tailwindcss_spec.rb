require "rails_helper"

RSpec.describe "stem_interiors/new", type: :view do
  before(:each) do
    assign(:stem_interior, StemInterior.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new stem_interior form" do
    render

    assert_select "form[action=?][method=?]", stem_interiors_path, "post" do
      assert_select "input[name=?]", "stem_interior[name]"

      assert_select "textarea[name=?]", "stem_interior[description]"

      assert_select "textarea[name=?]", "stem_interior[comments]"

      assert_select "input[name=?]", "stem_interior[source]"
    end
  end
end
