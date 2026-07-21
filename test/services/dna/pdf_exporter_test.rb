# frozen_string_literal: true

require "test_helper"

module Dna
  class PdfExporterTest < ActiveSupport::TestCase
    setup do
      @export_root = Dna::PdfExporter::EXPORT_ROOT
      FileUtils.rm_rf(@export_root)
    end

    teardown do
      FileUtils.rm_rf(@export_root)
    end

    test "export creates index and genera files without county guide" do
      observation_list = Dna::ObservationList.create!(
        title: "AMS Sequenced Specimens",
        product_type: "project",
        export_mode: "index_only",
        inat_project_id: "132913"
      )
      observation_list.observations.create!(
        inat_observation_id: 22,
        observation_taxon_name: "Amanita muscaria",
        taxon_name: "Amanita muscaria",
        inat_url: "https://www.inaturalist.org/observations/22",
        dna_field_value: "ITS"
      )

      result = Dna::PdfExporter.call(observation_list: observation_list)

      assert result.success?, result.error
      artifacts = Dna::ExportArtifact.where(observation_list: observation_list).to_a
      assert_equal [ "genera_count", "observations_index_pdf" ], artifacts.map(&:kind).sort
      assert artifacts.all? { |artifact| File.file?(artifact.absolute_path) }
      assert_not_includes artifacts.map(&:kind), "county_guide_pdf"
      assert_empty Dir.glob(@export_root.join("**", "*.{jpg,jpeg,png,webp}"))
    end

    test "county export uses the same index artifacts" do
      observation_list = Dna::ObservationList.create!(
        title: "Winston County",
        product_type: "county",
        export_mode: "full",
        inat_place_id: 1
      )
      observation_list.observations.create!(
        inat_observation_id: 33,
        observation_taxon_name: "Boletus sp.",
        inat_url: "https://www.inaturalist.org/observations/33",
        dna_field_value: "ITS"
      )

      result = Dna::PdfExporter.call(observation_list: observation_list)

      assert result.success?, result.error
      artifacts = Dna::ExportArtifact.where(observation_list: observation_list).to_a
      assert_equal [ "genera_count", "observations_index_pdf" ], artifacts.map(&:kind).sort
      assert_equal "index_only", observation_list.reload.export_mode
    end

    test "export replaces prior artifacts instead of retaining backups" do
      observation_list = Dna::ObservationList.create!(
        title: "Winston County", product_type: "county", inat_place_id: 1
      )

      first = Dna::PdfExporter.call(observation_list: observation_list)
      old_paths = first.data.fetch(:artifacts).map { |artifact| artifact.absolute_path.to_s }
      second = Dna::PdfExporter.call(observation_list: observation_list)

      assert second.success?, second.error
      assert_equal 2, observation_list.export_artifacts.count
      assert old_paths.none? { |path| File.exist?(path) }
    end
  end
end
