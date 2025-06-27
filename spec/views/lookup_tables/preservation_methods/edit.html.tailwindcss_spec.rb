require "rails_helper"

RSpec.describe "preservation_methods/edit", type: :view do
  let(:preservation_method) {
    PreservationMethod.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:preservation_method, preservation_method)
  end

  it "renders the edit preservation_method form" do
    render

    assert_select "form[action=?][method=?]", preservation_method_path(preservation_method), "post" do
      assert_select "input[name=?]", "preservation_method[name]"

      assert_select "textarea[name=?]", "preservation_method[description]"

      assert_select "textarea[name=?]", "preservation_method[comments]"

      assert_select "input[name=?]", "preservation_method[source]"
    end
  end
end
