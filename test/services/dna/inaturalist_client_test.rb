# frozen_string_literal: true

require "test_helper"

module Dna
  class InaturalistClientTest < ActiveSupport::TestCase
    test "retries iNaturalist rate limit responses" do
      responses = [
        response(Net::HTTPTooManyRequests, "429", "Too Many Requests", "rate limited"),
        response(Net::HTTPOK, "200", "OK", { results: [ { id: 123, display_name: "Baldwin County, Alabama, US" } ] }.to_json)
      ]
      sleeps = []
      client = Dna::InaturalistClient.new(delay: 0, timeout: 5)
      client.define_singleton_method(:sleep) { |seconds| sleeps << seconds }

      with_stubbed_http_start(->(*) { responses.shift }) do
        result = client.resolve_place_id("Baldwin County, US, AL")

        assert_equal 123, result[:id]
      end

      assert_equal [ 5 ], sleeps
      assert_empty responses
    end

    private

    def response(klass, code, message, body)
      klass.new("1.1", code, message).tap do |response|
        response.body = body
        response.instance_variable_set(:@read, true)
      end
    end

    def with_stubbed_http_start(callable)
      singleton = class << Net::HTTP; self; end
      original = Net::HTTP.method(:start)
      singleton.define_method(:start) { |*args, **kwargs, &block| callable.call(*args, **kwargs, &block) }
      yield
    ensure
      singleton.define_method(:start, original)
    end
  end
end
