require "rails_helper"

RSpec.describe "stem_interiors/edit", type: :view do
  let(:stem_interior) {
    StemInterior.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:stem_interior, stem_interior)
  end

  it "renders the edit stem_interior form" do
    render

    assert_select "form[action=?][method=?]", stem_interior_path(stem_interior), "post" do
      assert_select "input[name=?]", "stem_interior[name]"

      assert_select "textarea[name=?]", "stem_interior[description]"

      assert_select "textarea[name=?]", "stem_interior[comments]"

      assert_select "input[name=?]", "stem_interior[source]"
    end
  end
end
