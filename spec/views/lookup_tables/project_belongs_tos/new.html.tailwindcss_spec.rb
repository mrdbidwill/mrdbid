require "rails_helper"

RSpec.describe "project_belongs_tos/new", type: :view do
  before(:each) do
    assign(:project_belongs_to, ProjectBelongsTo.new(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    ))
  end

  it "renders new project_belongs_to form" do
    render

    assert_select "form[action=?][method=?]", project_belongs_tos_path, "post" do
      assert_select "input[name=?]", "project_belongs_to[name]"

      assert_select "textarea[name=?]", "project_belongs_to[description]"

      assert_select "textarea[name=?]", "project_belongs_to[comments]"

      assert_select "input[name=?]", "project_belongs_to[source]"
    end
  end
end
