# frozen_string_literal: true

module Dna
  class ArtifactPruner < ApplicationService
    def initialize(retention_hours: ENV.fetch("DNA_EXPORT_RETENTION_HOURS", "168").to_i)
      @retention_hours = [ retention_hours, 1 ].max
    end

    def call
      cutoff = @retention_hours.hours.ago
      removed = 0

      Dna::ExportArtifact.where("created_at < ?", cutoff).find_each do |artifact|
        path = artifact.absolute_path
        File.delete(path) if File.file?(path)
        artifact.destroy!
        removed += 1
      end

      Result.success(removed: removed)
    rescue StandardError => e
      Result.failure(e.message, data: { removed: removed || 0 })
    end
  end
end
