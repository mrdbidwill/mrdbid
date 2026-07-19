# frozen_string_literal: true

module Dna
  class ExportArtifact < ApplicationRecord
    self.table_name = "dna_export_artifacts"

    belongs_to :observation_list,
               class_name: "Dna::ObservationList",
               inverse_of: :export_artifacts

    validates :kind, :filename, :relative_path, presence: true

    scope :latest_first, -> { order(created_at: :desc, id: :desc) }

    def self.latest_per_kind
      latest_first.to_a.uniq(&:kind)
    end

    def absolute_path
      Rails.root.join(relative_path)
    end
  end
end
