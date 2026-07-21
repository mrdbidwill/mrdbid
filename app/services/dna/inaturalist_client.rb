# frozen_string_literal: true

require "json"
require "net/http"

module Dna
  class InaturalistClient
    DEFAULT_COUNTY_PROJECT_IDS = %w[124358 184305 132913 251751].freeze
    DEFAULT_AMS_PROJECT_ID = "132913"
    MAX_RETRIES = 3

    def initialize(
      base_url: ENV.fetch("DNA_INAT_BASE_URL", "https://api.inaturalist.org/v1"),
      user_agent: ENV.fetch("DNA_INAT_USER_AGENT", "myDNAobv-rails/1.0 (+https://mrdbid.com)"),
      delay: ENV.fetch("DNA_INAT_DELAY_SECONDS", "0.35").to_f,
      timeout: ENV.fetch("DNA_INAT_TIMEOUT_SECONDS", "20").to_i
    )
      @base_url = base_url.delete_suffix("/")
      @user_agent = user_agent
      @delay = [ delay, 0 ].max
      @timeout = [ timeout, 5 ].max
      @last_request_at = nil
    end

    def fetch_for_list(observation_list)
      if observation_list.county?
        fetch_county(observation_list)
      else
        fetch_project(observation_list)
      end
    end

    def resolve_place_id(query)
      payload = get_json("/places/autocomplete", q: query, per_page: 20)
      tokens = query.to_s.downcase.split(/[\s,]+/)
      payload.fetch("results", []).filter_map do |row|
        label = row["display_name"].presence || row["name"].presence
        next if label.blank? || row["id"].blank?

        score = tokens.count { |token| label.downcase.include?(token) }
        score += 2 if tokens.include?("county") && label.downcase.include?("county")
        { id: row["id"].to_i, name: label, score: score }
      end.max_by { |row| row[:score] }&.slice(:id, :name)
    end

    private

    attr_reader :base_url, :user_agent, :delay, :timeout

    def fetch_county(observation_list)
      place_id = observation_list.inat_place_id.presence
      place_id ||= resolve_place_id(observation_list.place_query.to_s)&.fetch(:id, nil)
      raise ArgumentError, "County list requires an iNaturalist place id or resolvable place query." if place_id.blank?

      by_id = {}
      county_project_ids.each do |project_id|
        each_observation(place_id: place_id, project_id: project_id) do |row|
          flat = flatten_observation(row)
          by_id[flat[:inat_observation_id]] = flat if flat && has_dna_barcode?(row)
        end
      end
      by_id.values
    end

    def fetch_project(observation_list)
      project_id = observation_list.inat_project_id.presence || ENV.fetch("DNA_AMS_PROJECT_ID", DEFAULT_AMS_PROJECT_ID)
      rows = []
      each_observation(project_id: project_id) do |row|
        flat = flatten_observation(row)
        rows << flat if flat && has_dna_barcode?(row)
      end
      rows
    end

    def each_observation(filters)
      max_pages = ENV.fetch("DNA_INAT_MAX_PAGES", "200").to_i.clamp(1, 2_000)
      max_observations = ENV.fetch("DNA_INAT_MAX_OBSERVATIONS", "5000").to_i.clamp(1, 100_000)
      yielded = 0

      1.upto(max_pages) do |page|
        payload = get_json(
          "/observations",
          {
            taxon_id: ENV.fetch("DNA_INAT_TAXON_ID", "47170"),
            per_page: 200,
            page: page,
            order_by: "observed_on",
            order: "desc",
            "field:#{dna_field_name}" => ""
          }.merge(filters)
        )

        results = Array(payload["results"])
        break if results.empty?

        results.each do |row|
          yield row
          yielded += 1
          return if yielded >= max_observations
        end

        total = payload["total_results"].to_i
        break if total.positive? && page >= (total / 200.0).ceil

        sleep delay if delay.positive?
      end
    end

    def get_json(path, params)
      uri = URI("#{base_url}#{path}")
      uri.query = URI.encode_www_form(params)
      request = Net::HTTP::Get.new(uri)
      request["User-Agent"] = user_agent
      request["Accept"] = "application/json"

      retries = 0
      response = nil

      loop do
        throttle_request
        response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: uri.scheme == "https",
                                                         open_timeout: timeout,
                                                         read_timeout: timeout) do |http|
          http.request(request)
        end

        break unless response.code.to_i == 429 && retries < MAX_RETRIES

        retries += 1
        sleep retry_delay(response, retries)
      end

      raise "iNaturalist HTTP #{response.code}: #{response.body.to_s.truncate(200)}" unless response.is_a?(Net::HTTPSuccess)

      JSON.parse(response.body)
    end

    def throttle_request
      return unless delay.positive?

      now = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      if @last_request_at
        elapsed = now - @last_request_at
        sleep(delay - elapsed) if elapsed < delay
      end
      @last_request_at = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    end

    def retry_delay(response, retries)
      retry_after = response["Retry-After"].to_i
      return retry_after if retry_after.positive?

      [ delay * (retries + 1) * 10, 5 ].max
    end

    def flatten_observation(row)
      inat_id = row["id"].to_i
      return nil if inat_id.zero?

      taxon = row["taxon"].is_a?(Hash) ? row["taxon"] : {}
      community = row["community_taxon"].is_a?(Hash) ? row["community_taxon"] : {}
      user = row["user"].is_a?(Hash) ? row["user"] : {}
      url = row["uri"].presence || row["url"].presence || "https://www.inaturalist.org/observations/#{inat_id}"

      {
        inat_observation_id: inat_id,
        taxon_name: taxon["name"].presence,
        species_guess: row["species_guess"].presence,
        scientific_name: row["scientific_name"].presence,
        common_name: taxon["preferred_common_name"].presence || taxon["common_name"].presence,
        observation_taxon_name: observer_taxon_name(row).presence || taxon["name"].presence,
        community_taxon_name: community["name"].presence,
        user_name: user["login"].presence,
        observed_at: parsed_time(row["time_observed_at"].presence || row["observed_on"].presence),
        inat_url: url,
        dna_field_value: field_value(row, dna_field_id),
        barcode_inferred_species_or_name: field_value(row, barcode_inferred_field_id)
      }
    end

    def observer_taxon_name(row)
      observer_id = row.dig("user", "id").to_i
      identifications = Array(row["identifications"])

      identifications.each do |identification|
        name = identification.dig("taxon", "name")
        next if name.blank?

        if identification["current"] && identification["own_observation"] && identification.dig("user", "id").to_i == observer_id
          return name
        end
      end

      identifications.each do |identification|
        name = identification.dig("taxon", "name")
        return name if name.present? && identification["current"]
      end

      nil
    end

    def has_dna_barcode?(row)
      field_value(row, dna_field_id).present?
    end

    def field_value(row, field_id)
      %w[ofvs observation_field_values].each do |key|
        Array(row[key]).each do |item|
          item_id = item["observation_field_id"] || item["field_id"] || item.dig("observation_field", "id")
          next unless item_id.to_s == field_id.to_s

          value = item["value"].to_s.strip
          return value if value.present?
        end
      end
      nil
    end

    def parsed_time(value)
      Time.zone.parse(value.to_s)
    rescue ArgumentError, TypeError
      nil
    end

    def county_project_ids
      ENV.fetch("DNA_COUNTY_PROJECT_IDS", DEFAULT_COUNTY_PROJECT_IDS.join(","))
         .split(/[,\s]+/)
         .map(&:strip)
         .reject(&:blank?)
         .uniq
    end

    def dna_field_id
      ENV.fetch("DNA_INAT_DNA_FIELD_ID", "2330")
    end

    def dna_field_name
      ENV.fetch("DNA_INAT_DNA_FIELD_NAME", "DNA Barcode ITS")
    end

    def barcode_inferred_field_id
      ENV.fetch("DNA_BARCODE_INFERRED_FIELD_ID", "20740")
    end
  end
end
