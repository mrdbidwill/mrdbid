require "rails_helper"

RSpec.describe "lens/new", type: :view do
  before(:each) do
    assign(:lens, Lens.new(
      make: "MyString",
      model: "MyString",
      description: "MyText",
      comments: "MyText"
    ))
  end

  it "renders new lens form" do
    render

    assert_select "form[action=?][method=?]", lens_index_path, "post" do
      assert_select "input[name=?]", "lens[make]"

      assert_select "input[name=?]", "lens[model]"

      assert_select "textarea[name=?]", "lens[description]"

      assert_select "textarea[name=?]", "lens[comments]"
    end
  end
end
