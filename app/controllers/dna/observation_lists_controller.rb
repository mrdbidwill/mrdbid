# frozen_string_literal: true

module Dna
  class ObservationListsController < ApplicationController
    skip_before_action :authenticate_user!, raise: false
    skip_after_action :verify_authorized, raise: false
    skip_after_action :verify_policy_scoped, raise: false

    def index
      @project_lists = Dna::ObservationList.public_downloads
                                              .where(product_type: "project")
                                              .ordered
                                              .includes(:export_artifacts)
      @county_lists = Dna::ObservationList.public_downloads
                                             .where(product_type: "county")
                                             .ordered
                                             .includes(:export_artifacts)
    end

    def show
      @observation_list = Dna::ObservationList.public_downloads
                                             .includes(:observations, :export_artifacts)
                                             .find(params[:id])
      @observations = Dna::GeneraCounter.sorted_observations(@observation_list.observations.to_a)
      @artifacts = @observation_list.export_artifacts.latest_per_kind
    end

    def download
      artifact = Dna::ExportArtifact.joins(:observation_list)
                                    .merge(Dna::ObservationList.public_downloads)
                                    .find(params[:artifact_id])
      path = artifact.absolute_path
      raise ActiveRecord::RecordNotFound unless File.file?(path)

      send_file path,
                filename: artifact.filename,
                type: content_type_for(artifact),
                disposition: "attachment"
    end

    private

    def content_type_for(artifact)
      artifact.filename.end_with?(".pdf") ? "application/pdf" : "text/plain"
    end
  end
end
