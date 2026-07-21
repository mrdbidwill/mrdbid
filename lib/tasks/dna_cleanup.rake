# frozen_string_literal: true

namespace :dna do
  desc "Remove obsolete DNA artifact rows and unreferenced DNA export files"
  task cleanup_exports: :environment do
    removed_rows = 0

    Dna::ObservationList.find_each do |observation_list|
      keep_ids = observation_list.export_artifacts.latest_first.to_a.uniq(&:kind).map(&:id)
      observation_list.export_artifacts.where.not(id: keep_ids).find_each do |artifact|
        File.delete(artifact.absolute_path) if File.file?(artifact.absolute_path)
        artifact.destroy!
        removed_rows += 1
      end
    end

    referenced = Dna::ExportArtifact.pluck(:relative_path).map { |path| Rails.root.join(path).cleanpath.to_s }.to_set
    removed_files = 0
    Dir.glob(Dna::PdfExporter::EXPORT_ROOT.join("**", "*")).select { |path| File.file?(path) }.each do |path|
      next if referenced.include?(Pathname(path).cleanpath.to_s)

      File.delete(path)
      removed_files += 1
    end
    Dir.glob(Dna::PdfExporter::EXPORT_ROOT.join("**", "*"))
      .select { |path| File.directory?(path) }
      .sort_by { |path| -path.length }
      .each { |path| Dir.rmdir(path) if Dir.empty?(path) }

    puts "Removed #{removed_rows} obsolete DNA artifact rows and #{removed_files} unreferenced files."
  end
end
