require "rails_helper"

RSpec.describe "odors/edit", type: :view do
  let(:odor) {
    Odor.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:odor, odor)
  end

  it "renders the edit odor form" do
    render

    assert_select "form[action=?][method=?]", odor_path(odor), "post" do
      assert_select "input[name=?]", "odor[name]"

      assert_select "textarea[name=?]", "odor[description]"

      assert_select "textarea[name=?]", "odor[comments]"

      assert_select "input[name=?]", "odor[source]"
    end
  end
end
