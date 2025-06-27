require "rails_helper"

RSpec.describe "stem_surfaces/new", type: :view do
  before(:each) do
    assign(:stem_surface, StemSurface.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new stem_surface form" do
    render

    assert_select "form[action=?][method=?]", stem_surfaces_path, "post" do
      assert_select "input[name=?]", "stem_surface[name]"

      assert_select "textarea[name=?]", "stem_surface[description]"

      assert_select "textarea[name=?]", "stem_surface[comments]"

      assert_select "input[name=?]", "stem_surface[source]"
    end
  end
end
