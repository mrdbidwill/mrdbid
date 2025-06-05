require "test_helper"

class GillAttachmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gill_attachment = gill_attachments(:one)
  end

  test "should get index" do
    get gill_attachments_url
    assert_response :success
  end

  test "should get new" do
    get new_gill_attachment_url
    assert_response :success
  end

  test "should create gill_attachment" do
    assert_difference("GillAttachment.count") do
      post gill_attachments_url, params: { gill_attachment: { comments: @gill_attachment.comments, description: @gill_attachment.description, entered_by_id: @gill_attachment.entered_by_id, name: @gill_attachment.name, source_id: @gill_attachment.source_id } }
    end

    assert_redirected_to gill_attachment_url(GillAttachment.last)
  end

  test "should show gill_attachment" do
    get gill_attachment_url(@gill_attachment)
    assert_response :success
  end

  test "should get edit" do
    get edit_gill_attachment_url(@gill_attachment)
    assert_response :success
  end

  test "should update gill_attachment" do
    patch gill_attachment_url(@gill_attachment), params: { gill_attachment: { comments: @gill_attachment.comments, description: @gill_attachment.description, entered_by_id: @gill_attachment.entered_by_id, name: @gill_attachment.name, source_id: @gill_attachment.source_id } }
    assert_redirected_to gill_attachment_url(@gill_attachment)
  end

  test "should destroy gill_attachment" do
    assert_difference("GillAttachment.count", -1) do
      delete gill_attachment_url(@gill_attachment)
    end

    assert_redirected_to gill_attachments_url
  end
end
