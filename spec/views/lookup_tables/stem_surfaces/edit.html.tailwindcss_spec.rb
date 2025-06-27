require "rails_helper"

RSpec.describe "stem_surfaces/edit", type: :view do
  let(:stem_surface) {
    StemSurface.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:stem_surface, stem_surface)
  end

  it "renders the edit stem_surface form" do
    render

    assert_select "form[action=?][method=?]", stem_surface_path(stem_surface), "post" do
      assert_select "input[name=?]", "stem_surface[name]"

      assert_select "textarea[name=?]", "stem_surface[description]"

      assert_select "textarea[name=?]", "stem_surface[comments]"

      assert_select "input[name=?]", "stem_surface[source]"
    end
  end
end
