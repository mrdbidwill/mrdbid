# frozen_string_literal: true

module Dna
  class ObservationSyncer < ApplicationService
    def initialize(observation_list:, client: Dna::InaturalistClient.new)
      @observation_list = observation_list
      @client = client
    end

    def call
      rows = @client.fetch_for_list(@observation_list)

      Dna::Observation.transaction do
        @observation_list.observations.delete_all
        rows.each do |attributes|
          @observation_list.observations.create!(attributes)
        end
        @observation_list.update!(last_sync_at: Time.current)
      end

      Result.success(count: rows.length)
    rescue StandardError => e
      Result.failure(e.message)
    end
  end
end
