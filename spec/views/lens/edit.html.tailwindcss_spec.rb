require "rails_helper"

RSpec.describe "lens/edit", type: :view do
  let(:lens) {
    Lens.create!(
      make: "MyString",
      model: "MyString",
      description: "MyText",
      comments: "MyText"
    )
  }

  before(:each) do
    assign(:lens, lens)
  end

  it "renders the edit lens form" do
    render

    assert_select "form[action=?][method=?]", lens_path(lens), "post" do
      assert_select "input[name=?]", "lens[make]"

      assert_select "input[name=?]", "lens[model]"

      assert_select "textarea[name=?]", "lens[description]"

      assert_select "textarea[name=?]", "lens[comments]"
    end
  end
end
