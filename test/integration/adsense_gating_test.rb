# frozen_string_literal: true

require "test_helper"

class AdsenseGatingTest < ActionDispatch::IntegrationTest
  setup do
    @original_enabled = ENV["ADSENSE_ENABLED"]
    @original_client_id = ENV["ADSENSE_CLIENT_ID"]
    @original_slot_id = ENV["ADSENSE_SLOT_ID"]
    ENV["ADSENSE_ENABLED"] = "true"
    ENV["ADSENSE_CLIENT_ID"] = "ca-pub-8323362126637830"
    ENV["ADSENSE_SLOT_ID"] = "1234567890"
  end

  teardown do
    ENV["ADSENSE_ENABLED"] = @original_enabled
    ENV["ADSENSE_CLIENT_ID"] = @original_client_id
    ENV["ADSENSE_SLOT_ID"] = @original_slot_id
  end

  test "adsense script and slot are included for public pages" do
    get root_path
    assert_response :success
    assert_includes response.body, "pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"
    assert_includes response.body, "ca-pub-8323362126637830"
    assert_includes response.body, 'class="adsbygoogle"'
    assert_includes response.body, 'data-ad-slot="1234567890"'
  end

  test "adsense slot is excluded when slot id is blank" do
    ENV["ADSENSE_SLOT_ID"] = ""

    get root_path
    assert_response :success
    assert_includes response.body, "pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"
    assert_not_includes response.body, 'class="adsbygoogle"'
  end

  test "adsense script and slot are excluded for authenticated pages" do
    sign_in users(:one)
    get root_path
    assert_response :success
    assert_not_includes response.body, "pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"
    assert_not_includes response.body, 'class="adsbygoogle"'
  end
end
