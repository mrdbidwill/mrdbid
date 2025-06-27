require "rails_helper"

RSpec.describe "veils/edit", type: :view do
  let(:veil) {
    Veil.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:veil, veil)
  end

  it "renders the edit veil form" do
    render

    assert_select "form[action=?][method=?]", veil_path(veil), "post" do
      assert_select "input[name=?]", "veil[name]"

      assert_select "textarea[name=?]", "veil[description]"

      assert_select "textarea[name=?]", "veil[comments]"

      assert_select "input[name=?]", "veil[source]"
    end
  end
end
