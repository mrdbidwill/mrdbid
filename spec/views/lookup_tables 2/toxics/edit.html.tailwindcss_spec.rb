require "rails_helper"

RSpec.describe "toxics/edit", type: :view do
  let(:toxic) {
    Toxic.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:toxic, toxic)
  end

  it "renders the edit toxic form" do
    render

    assert_select "form[action=?][method=?]", toxic_path(toxic), "post" do
      assert_select "input[name=?]", "toxic[name]"

      assert_select "textarea[name=?]", "toxic[description]"

      assert_select "textarea[name=?]", "toxic[comments]"

      assert_select "input[name=?]", "toxic[source]"
    end
  end
end
