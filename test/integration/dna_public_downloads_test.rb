# frozen_string_literal: true

require "test_helper"

class DnaPublicDownloadsTest < ActionDispatch::IntegrationTest
  test "public DNA index separates project downloads from county indexes" do
    ams = Dna::ObservationList.create!(
      title: "AMS Sequenced Specimens",
      product_type: "project",
      export_mode: "index_only",
      public_download: true,
      inat_project_id: "132913"
    )
    county = Dna::ObservationList.create!(
      title: "Baldwin County-AL",
      product_type: "county",
      export_mode: "index_only",
      public_download: true,
      county_name: "Baldwin County"
    )

    get dna_root_path

    assert_response :success
    assert_select "h1", "DNA Downloads"
    assert_select "h2", "Project Downloads"
    assert_select "h2", "County Indexes"
    assert_select "section", text: /Project Downloads.*#{ams.title}/m
    assert_select "section", text: /County Indexes.*#{county.title}/m
  end

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

  test "public DNA show page renders only the latest artifact for each kind" do
    observation_list = Dna::ObservationList.create!(
      title: "Baldwin County-AL",
      product_type: "county",
      export_mode: "index_only",
      public_download: true
    )
    older = 2.days.ago
    newer = 1.hour.ago

    observation_list.export_artifacts.create!(
      kind: "genera_count",
      filename: "genera_count.txt",
      relative_path: "storage/dna_exports/test/older_genera_count.txt",
      size_bytes: 12,
      created_at: older,
      updated_at: older
    )
    observation_list.export_artifacts.create!(
      kind: "observations_index_pdf",
      filename: "observations_index.pdf",
      relative_path: "storage/dna_exports/test/older_observations_index.pdf",
      size_bytes: 12,
      created_at: older,
      updated_at: older
    )
    observation_list.export_artifacts.create!(
      kind: "genera_count",
      filename: "genera_count.txt",
      relative_path: "storage/dna_exports/test/newer_genera_count.txt",
      size_bytes: 34,
      created_at: newer,
      updated_at: newer
    )
    observation_list.export_artifacts.create!(
      kind: "observations_index_pdf",
      filename: "observations_index.pdf",
      relative_path: "storage/dna_exports/test/newer_observations_index.pdf",
      size_bytes: 56,
      created_at: newer,
      updated_at: newer
    )

    get dna_observation_list_path(observation_list)

    assert_response :success
    assert_select "div.font-medium", text: "genera_count.txt", count: 1
    assert_select "div.font-medium", text: "observations_index.pdf", count: 1
    assert_select "a", text: "Download", count: 2
  end
end
