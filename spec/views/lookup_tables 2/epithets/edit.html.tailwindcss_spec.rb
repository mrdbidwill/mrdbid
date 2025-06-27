require "rails_helper"

RSpec.describe "epithets/edit", type: :view do
  let(:epithet) {
    Epithet.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:epithet, epithet)
  end

  it "renders the edit epithet form" do
    render

    assert_select "form[action=?][method=?]", epithet_path(epithet), "post" do
      assert_select "input[name=?]", "epithet[name]"

      assert_select "textarea[name=?]", "epithet[description]"

      assert_select "textarea[name=?]", "epithet[comments]"

      assert_select "input[name=?]", "epithet[source]"
    end
  end
end
