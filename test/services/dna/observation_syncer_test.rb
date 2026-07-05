# frozen_string_literal: true

require "test_helper"

module Dna
  class ObservationSyncerTest < ActiveSupport::TestCase
    FakeClient = Struct.new(:rows) do
      def fetch_for_list(_observation_list)
        rows
      end
    end

    test "sync replaces cached observations and stamps last sync" do
      observation_list = Dna::ObservationList.create!(
        title: "AMS Sequenced Specimens",
        product_type: "project",
        export_mode: "index_only",
        inat_project_id: "132913"
      )
      observation_list.observations.create!(
        inat_observation_id: 1,
        inat_url: "https://www.inaturalist.org/observations/1"
      )

      result = Dna::ObservationSyncer.call(
        observation_list: observation_list,
        client: FakeClient.new([
          {
            inat_observation_id: 2,
            taxon_name: "Amanita muscaria",
            observation_taxon_name: "Amanita muscaria",
            inat_url: "https://www.inaturalist.org/observations/2",
            dna_field_value: "ITS"
          }
        ])
      )

      assert result.success?
      assert_equal 1, observation_list.observations.count
      assert_equal 2, observation_list.observations.first.inat_observation_id
      assert observation_list.reload.last_sync_at.present?
    end
  end
end
