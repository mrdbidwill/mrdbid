require "rails_helper"

RSpec.describe "project_belongs_tos/edit", type: :view do
  let(:project_belongs_to) {
    ProjectBelongsTo.create!(
      name: "MyString",
      description: "MyText",
      comments: "MyText",
      source: nil
    )
  }

  before(:each) do
    assign(:project_belongs_to, project_belongs_to)
  end

  it "renders the edit project_belongs_to form" do
    render

    assert_select "form[action=?][method=?]", project_belongs_to_path(project_belongs_to), "post" do
      assert_select "input[name=?]", "project_belongs_to[name]"

      assert_select "textarea[name=?]", "project_belongs_to[description]"

      assert_select "textarea[name=?]", "project_belongs_to[comments]"

      assert_select "input[name=?]", "project_belongs_to[source]"
    end
  end
end
