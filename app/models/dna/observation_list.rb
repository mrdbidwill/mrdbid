# frozen_string_literal: true

module Dna
  class ObservationList < ApplicationRecord
    self.table_name = "dna_observation_lists"

    has_many :observations,
             class_name: "Dna::Observation",
             dependent: :destroy,
             inverse_of: :observation_list
    has_many :export_artifacts,
             class_name: "Dna::ExportArtifact",
             dependent: :destroy,
             inverse_of: :observation_list

    before_validation :force_index_only_export_mode

    validates :title, presence: true
    validates :product_type, presence: true, inclusion: { in: %w[county project] }
    validates :export_mode, presence: true, inclusion: { in: %w[index_only] }

    scope :public_downloads, -> { where(public_download: true) }
    scope :ordered, -> { order(:title, :id) }

    def index_only?
      export_mode == "index_only"
    end

    def county?
      product_type == "county"
    end

    def project?
      product_type == "project"
    end

    private

    def force_index_only_export_mode
      self.export_mode = "index_only"
    end
  end
end
