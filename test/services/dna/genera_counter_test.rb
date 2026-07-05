# frozen_string_literal: true

require "test_helper"

module Dna
  class GeneraCounterTest < ActiveSupport::TestCase
    ObservationStub = Struct.new(
      :observation_taxon_name,
      :scientific_name,
      :taxon_name,
      :community_taxon_name,
      :species_guess,
      :common_name,
      :inat_observation_id,
      keyword_init: true
    )

    test "counts genera from preferred observation titles" do
      observations = [
        ObservationStub.new(observation_taxon_name: "Amanita muscaria", inat_observation_id: 3),
        ObservationStub.new(observation_taxon_name: "cf Amanita amerirubescens", inat_observation_id: 2),
        ObservationStub.new(observation_taxon_name: "Boletus sp.", inat_observation_id: 1)
      ]

      assert_equal [ "1. Amanita (2)", "2. Boletus (1)" ], Dna::GeneraCounter.lines(observations)
    end

    test "sorts by genus title and observation id" do
      observations = [
        ObservationStub.new(observation_taxon_name: "Boletus sp.", inat_observation_id: 2),
        ObservationStub.new(observation_taxon_name: "Amanita muscaria", inat_observation_id: 3),
        ObservationStub.new(observation_taxon_name: "Amanita amerirubescens", inat_observation_id: 1)
      ]

      sorted_ids = Dna::GeneraCounter.sorted_observations(observations).map(&:inat_observation_id)

      assert_equal [ 1, 3, 2 ], sorted_ids
    end
  end
end
