# frozen_string_literal: true

module Dna
  class Observation < ApplicationRecord
    self.table_name = "dna_observations"

    belongs_to :observation_list,
               class_name: "Dna::ObservationList",
               inverse_of: :observations

    validates :inat_observation_id, presence: true
    validates :inat_url, presence: true
    validates :inat_observation_id, uniqueness: { scope: :observation_list_id }

    scope :by_inat_id, -> { order(:inat_observation_id) }
  end
end
