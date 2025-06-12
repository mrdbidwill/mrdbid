require "test_helper"

class ProjectBelongsTosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_belongs_to = project_belongs_tos(:one)
  end

  test "should get index" do
    get project_belongs_tos_url
    assert_response :success
  end

  test "should get new" do
    get new_project_belongs_to_url
    assert_response :success
  end

  test "should create project_belongs_to" do
    assert_difference("ProjectBelongsTo.count") do
      post project_belongs_tos_url, params: { project_belongs_to: { comments: @project_belongs_to.comments, description: @project_belongs_to.description, entered_by_id: @project_belongs_to.entered_by_id, name: @project_belongs_to.name, source_id: @project_belongs_to.source_id } }
    end

    assert_redirected_to project_belongs_to_url(ProjectBelongsTo.last)
  end

  test "should show project_belongs_to" do
    get project_belongs_to_url(@project_belongs_to)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_belongs_to_url(@project_belongs_to)
    assert_response :success
  end

  test "should update project_belongs_to" do
    patch project_belongs_to_url(@project_belongs_to), params: { project_belongs_to: { comments: @project_belongs_to.comments, description: @project_belongs_to.description, entered_by_id: @project_belongs_to.entered_by_id, name: @project_belongs_to.name, source_id: @project_belongs_to.source_id } }
    assert_redirected_to project_belongs_to_url(@project_belongs_to)
  end

  test "should destroy project_belongs_to" do
    assert_difference("ProjectBelongsTo.count", -1) do
      delete project_belongs_to_url(@project_belongs_to)
    end

    assert_redirected_to project_belongs_tos_url
  end
end
