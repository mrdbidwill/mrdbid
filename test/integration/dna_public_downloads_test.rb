# frozen_string_literal: true

require "test_helper"

class DnaPublicDownloadsTest < ActionDispatch::IntegrationTest
  test "public DNA show page renders cached observations under strict loading" do
    observation_list = Dna::ObservationList.create!(
      title: "AMS Sequenced Specimens",
      product_type: "project",
      export_mode: "index_only",
      public_download: true,
      inat_project_id: "132913"
    )
    observation_list.observations.create!(
      inat_observation_id: 345,
      observation_taxon_name: "Amanita muscaria",
      inat_url: "https://www.inaturalist.org/observations/345",
      dna_field_value: "ITS"
    )
    observation_list.export_artifacts.create!(
      kind: "genera_count",
      filename: "genera_count.txt",
      relative_path: "storage/dna_exports/test/genera_count.txt",
      size_bytes: 12
    )

    get dna_observation_list_path(observation_list)

    assert_response :success
    assert_select "h1", "AMS Sequenced Specimens"
    assert_select "li", /Amanita muscaria/
    assert_select "div", /genera_count.txt/
  end
end
