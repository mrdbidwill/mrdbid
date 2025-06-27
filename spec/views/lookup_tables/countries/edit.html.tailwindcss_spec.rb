require "rails_helper"

RSpec.describe "countries/edit", type: :view do
  let(:country) {
    Country.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:country, country)
  end

  it "renders the edit country form" do
    render

    assert_select "form[action=?][method=?]", country_path(country), "post" do
      assert_select "input[name=?]", "country[name]"

      assert_select "textarea[name=?]", "country[description]"

      assert_select "textarea[name=?]", "country[comments]"

      assert_select "input[name=?]", "country[source]"
    end
  end
end
