# frozen_string_literal: true

require "test_helper"
require "stringio"

class ActiveStorage::Service::R2ServiceTest < ActiveSupport::TestCase
  class TrackingIO < StringIO
    attr_reader :rewind_calls

    def rewind
      @rewind_calls = @rewind_calls.to_i + 1
      super
    end
  end

  setup do
    @original_base = Rails.application.config.x.r2_public_base_url
    Rails.application.config.x.r2_public_base_url = "https://images.example.com"
  end

  teardown do
    Rails.application.config.x.r2_public_base_url = @original_base
  end

  test "initialize strips acl from upload options for R2 compatibility" do
    service = build_service(upload: { acl: "public-read", cache_control: "max-age=3600" })

    assert_nil service.upload_options[:acl]
    assert_equal "max-age=3600", service.upload_options[:cache_control]
  end

  test "upload retries once without checksum for R2 checksum conflict errors" do
    service = build_service
    attempts = 0

    service.client.client.stub_responses(:put_object, lambda { |_context|
      attempts += 1
      raise StandardError, "only specify one non-default checksum" if attempts == 1

      {}
    })

    io = TrackingIO.new("binary-data")
    service.upload("retry-test.txt", io, checksum: "abc123==")

    assert_equal 2, attempts
    assert_operator io.rewind_calls.to_i, :>=, 1
  end

  test "upload re-raises non-checksum errors" do
    service = build_service

    service.client.client.stub_responses(:put_object, lambda { |_context|
      raise StandardError, "some other upload failure"
    })

    error = assert_raises(StandardError) do
      service.upload("error-test.txt", StringIO.new("x"), checksum: "abc123==")
    end

    assert_match(/other upload failure/i, error.message)
  end

  test "upload does not retry checksum conflict when no checksum was provided" do
    service = build_service
    attempts = 0

    service.client.client.stub_responses(:put_object, lambda { |_context|
      attempts += 1
      raise StandardError, "only specify one non-default checksum"
    })

    assert_raises(StandardError) do
      service.upload("no-checksum.txt", StringIO.new("x"), checksum: nil)
    end

    assert_equal 1, attempts
  end

  test "public_url prefers configured public base url" do
    service = build_service

    assert_equal "https://images.example.com/path/to/file.jpg", service.public_url("path/to/file.jpg")
  end

  test "public_url falls back to s3-style url when base url is blank" do
    service = build_service
    Rails.application.config.x.r2_public_base_url = ""

    url = service.public_url("path/to/file.jpg")

    assert_match(%r{https://}, url)
    assert_match(%r{/path/to/file\.jpg\z}, url)
  end

  private

  def build_service(upload: {})
    ActiveStorage::Service::R2Service.new(
      bucket: "test-bucket",
      access_key_id: "key",
      secret_access_key: "secret",
      region: "us-east-1",
      endpoint: "https://example.r2.cloudflarestorage.com",
      force_path_style: true,
      stub_responses: true,
      upload: upload
    )
  end
end
