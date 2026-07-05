# frozen_string_literal: true

module Dna
  class GeneraCounter
    QUALIFIER_TOKENS = %w[cf aff nr sp spp complex group sect subsp var forma].freeze

    def self.preferred_title(observation)
      [
        observation.observation_taxon_name,
        observation.scientific_name,
        observation.taxon_name,
        observation.community_taxon_name,
        observation.species_guess,
        observation.common_name
      ].find(&:present?) || "Observation #{observation.inat_observation_id}"
    end

    def self.genus_label(title)
      title.to_s.split.each do |token|
        cleaned = token.gsub(/[^A-Za-z-]/, "").delete_prefix("-").delete_suffix("-")
        next if cleaned.blank?
        next if QUALIFIER_TOKENS.include?(cleaned.downcase)

        return cleaned
      end
      ""
    end

    def self.sorted_observations(observations)
      observations.sort_by do |observation|
        title = preferred_title(observation)
        genus = genus_label(title).presence || "zzzzzzzz"
        [ genus.downcase, title.downcase, observation.inat_observation_id.to_i ]
      end
    end

    def self.lines(observations)
      counts = Hash.new(0)
      labels = {}

      observations.each do |observation|
        label = genus_label(preferred_title(observation))
        next if label.blank?

        key = label.downcase
        counts[key] += 1
        labels[key] ||= label
      end

      counts.keys.sort.map.with_index(1) do |key, index|
        "#{index}. #{labels[key]} (#{counts[key]})"
      end
    end
  end
end
