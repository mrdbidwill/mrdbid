require "application_system_test_case"

class GillAttachmentsTest < ApplicationSystemTestCase
  setup do
    @gill_attachment = gill_attachments(:one)
  end

  test "visiting the index" do
    visit gill_attachments_url
    assert_selector "h1", text: "Gill attachments"
  end

  test "should create gill attachment" do
    visit gill_attachments_url
    click_on "New gill attachment"

    fill_in "Comments", with: @gill_attachment.comments
    fill_in "Description", with: @gill_attachment.description
    fill_in "Entered by", with: @gill_attachment.entered_by_id
    fill_in "Name", with: @gill_attachment.name
    fill_in "Source", with: @gill_attachment.source_id
    click_on "Create Gill attachment"

    assert_text "Gill attachment was successfully created"
    click_on "Back"
  end

  test "should update Gill attachment" do
    visit gill_attachment_url(@gill_attachment)
    click_on "Edit this gill attachment", match: :first

    fill_in "Comments", with: @gill_attachment.comments
    fill_in "Description", with: @gill_attachment.description
    fill_in "Entered by", with: @gill_attachment.entered_by_id
    fill_in "Name", with: @gill_attachment.name
    fill_in "Source", with: @gill_attachment.source_id
    click_on "Update Gill attachment"

    assert_text "Gill attachment was successfully updated"
    click_on "Back"
  end

  test "should destroy Gill attachment" do
    visit gill_attachment_url(@gill_attachment)
    accept_confirm { click_on "Destroy this gill attachment", match: :first }

    assert_text "Gill attachment was successfully destroyed"
  end
end
