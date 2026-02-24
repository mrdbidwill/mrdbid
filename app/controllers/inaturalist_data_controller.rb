class InaturalistDataController < ApplicationController
  skip_after_action :verify_policy_scoped, only: [:index], raise: false
  skip_after_action :verify_authorized, only: [:download_csv, :download_json], raise: false

  def index
    @query = params[:q]
    @observation_fields = InaturalistObservationField.all

    # Apply search if query present
    @observation_fields = @observation_fields.search(@query) if @query.present?

    # Order and paginate
    @observation_fields = @observation_fields.recent.page(params[:page]).per(50)
    @total_count = InaturalistObservationField.count
  end

  def download_csv
    send_file Rails.root.join('tmp', 'inaturalist_observation_fields.csv'),
              filename: 'inaturalist_observation_fields.csv',
              type: 'text/csv',
              disposition: 'attachment'
  rescue Errno::ENOENT
    redirect_to inaturalist_observation_fields_path, alert: "CSV file not found"
  end

  def download_json
    # Generate JSON from database
    @observation_fields = InaturalistObservationField.all
    json_data = @observation_fields.as_json(except: [:id, :created_at, :updated_at])

    send_data json_data.to_json,
              filename: 'inaturalist_observation_fields.json',
              type: 'application/json',
              disposition: 'attachment'
  end
end
