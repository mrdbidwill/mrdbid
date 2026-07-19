# frozen_string_literal: true

require "fileutils"
require "prawn"

module Dna
  class PdfExporter < ApplicationService
    EXPORT_ROOT = Rails.root.join("storage", "dna_exports")

    def initialize(observation_list:)
      @observation_list = observation_list
    end

    def call
      observations = Dna::GeneraCounter.sorted_observations(
        @observation_list.observations.by_inat_id.to_a
      )
      export_dir = EXPORT_ROOT.join("list_#{@observation_list.id}", Time.current.utc.strftime("%Y%m%d_%H%M%S"))
      FileUtils.mkdir_p(export_dir)

      artifacts = []
      artifacts << write_index_pdf(export_dir, observations)
      artifacts << write_genera_count(export_dir, observations)

      Result.success(artifacts: artifacts.compact)
    rescue StandardError => e
      Result.failure(e.message)
    end

    private

    def write_index_pdf(export_dir, observations)
      filename = "observations_index.pdf"
      path = export_dir.join(filename)

      Prawn::Document.generate(path.to_s, page_size: "LETTER", margin: 40) do |pdf|
        pdf.text "DNA-Confirmed Observations Index", size: 16, style: :bold
        pdf.move_down 8
        pdf.text "List: #{safe(@observation_list.title)}", size: 10
        pdf.text "Offline note: this PDF can be viewed offline. External iNaturalist links require internet access.", size: 9
        pdf.move_down 12

        if observations.empty?
          pdf.text "No DNA-confirmed observations were cached at build time.", size: 10
        end

        observations.each.with_index(1) do |observation, index|
          write_observation_entry(pdf, observation, index)
        end
      end

      record_artifact("observations_index_pdf", filename, path)
    end

    def write_genera_count(export_dir, observations)
      filename = "genera_count.txt"
      path = export_dir.join(filename)
      File.write(path, Dna::GeneraCounter.lines(observations).join("\n") + "\n")
      record_artifact("genera_count", filename, path)
    end

    def record_artifact(kind, filename, path)
      @observation_list.export_artifacts.create!(
        kind: kind,
        filename: filename,
        relative_path: path.relative_path_from(Rails.root).to_s,
        size_bytes: File.size(path)
      )
    end

    def write_observation_entry(pdf, observation, index)
      pdf.start_new_page if pdf.cursor < 90
      pdf.text "#{index}. #{safe(Dna::GeneraCounter.preferred_title(observation))}", size: 12, style: :bold
      pdf.text "iNaturalist taxon: #{safe(observation.taxon_name.presence || "Not available")}", size: 10
      pdf.text "Observation taxon: #{safe(observation.observation_taxon_name.presence || observation.scientific_name.presence || "Not available")}", size: 10
      pdf.text "Community taxon: #{safe(observation.community_taxon_name.presence || "Not available")}", size: 10
      pdf.text "Barcode Inferred Species or Name: #{safe(observation.barcode_inferred_species_or_name.presence || "No set")}", size: 10
      pdf.text "Observed: #{date_label(observation.observed_at)} | Observer: #{safe(observation.user_name.presence || "Unknown observer")}", size: 10
      pdf.text "Common name: #{safe(observation.common_name.presence || "Not provided")}", size: 10
      link(pdf, "iNaturalist", observation.inat_url)
      pdf.move_down 8
    end

    def link(pdf, label, url)
      pdf.formatted_text [
        { text: "#{label}: ", styles: [ :bold ] },
        { text: url.to_s, color: "0645AD", link: url.to_s }
      ], size: 10
    end

    def date_label(value)
      value&.to_date&.iso8601 || "Unknown date"
    end

    def safe(value)
      value.to_s.encode("Windows-1252", invalid: :replace, undef: :replace, replace: "?")
           .encode("UTF-8", invalid: :replace, undef: :replace, replace: "?")
    end
  end
end
