class InaturalistDataController < ApplicationController
  def index
    csv_path = Rails.root.join('data', 'inaturalist', 'observation_fields.csv')
    @observation_fields = []
    @total_count = 0

    if File.exist?(csv_path)
      require 'csv'
      CSV.foreach(csv_path, headers: true) do |row|
        @observation_fields << row.to_h
      end
      @total_count = @observation_fields.count
    end
  end

  def download_csv
    send_file Rails.root.join('data', 'inaturalist', 'observation_fields.csv'),
              filename: 'inaturalist_observation_fields.csv',
              type: 'text/csv',
              disposition: 'attachment'
  end

  def download_json
    send_file Rails.root.join('data', 'inaturalist', 'observation_fields.json'),
              filename: 'inaturalist_observation_fields.json',
              type: 'application/json',
              disposition: 'attachment'
  end
end
