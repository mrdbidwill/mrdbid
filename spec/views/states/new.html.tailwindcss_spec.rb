require "rails_helper"

RSpec.describe "states/new", type: :view do
  before(:each) do
    assign(:state, State.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil,
      country: nil
    ))
  end

  it "renders new state form" do
    render

    assert_select "form[action=?][method=?]", states_path, "post" do
      assert_select "input[name=?]", "state[name]"

      assert_select "textarea[name=?]", "state[description]"

      assert_select "textarea[name=?]", "state[comments]"

      assert_select "input[name=?]", "state[source]"

      assert_select "input[name=?]", "state[country_id]"
    end
  end
end
