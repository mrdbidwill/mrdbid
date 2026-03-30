# frozen_string_literal: true

require "test_helper"

class AdsenseGatingTest < ActionDispatch::IntegrationTest
  setup do
    @original_enabled = ENV["ADSENSE_ENABLED"]
    ENV["ADSENSE_ENABLED"] = "true"
  end

  teardown do
    ENV["ADSENSE_ENABLED"] = @original_enabled
  end

  test "adsense script is included for public pages" do
    get root_path
    assert_response :success
    assert_includes response.body, "pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"
    assert_includes response.body, "ca-pub-8323362126637830"
  end

  test "adsense script is excluded for authenticated pages" do
    sign_in users(:one)
    get root_path
    assert_response :success
    assert_not_includes response.body, "pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"
  end
end
