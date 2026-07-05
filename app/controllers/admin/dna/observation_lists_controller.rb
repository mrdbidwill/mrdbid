# frozen_string_literal: true

module Admin
  module Dna
    class ObservationListsController < Admin::ApplicationController
      def index
        @observation_lists = policy_scope(::Dna::ObservationList).ordered.includes(:export_artifacts)
        @observation_list = ::Dna::ObservationList.new(
          product_type: "project",
          export_mode: "index_only",
          inat_project_id: ENV.fetch("DNA_AMS_PROJECT_ID", ::Dna::InaturalistClient::DEFAULT_AMS_PROJECT_ID),
          title: "AMS Sequenced Specimens"
        )
      end

      def create
        @observation_list = ::Dna::ObservationList.new(observation_list_params)
        authorize @observation_list

        if @observation_list.save
          redirect_to admin_dna_observation_lists_path, notice: "DNA list created."
        else
          @observation_lists = policy_scope(::Dna::ObservationList).ordered.includes(:export_artifacts)
          render :index, status: :unprocessable_entity
        end
      end

      def sync
        observation_list = ::Dna::ObservationList.find(params[:id])
        authorize observation_list, :sync?

        result = ::Dna::ObservationSyncer.call(observation_list: observation_list)
        if result.success?
          redirect_to admin_dna_observation_lists_path,
                      notice: "Synced #{result.data[:count]} DNA observations."
        else
          redirect_to admin_dna_observation_lists_path,
                      alert: "Sync failed: #{result.error}"
        end
      end

      def export
        observation_list = ::Dna::ObservationList.find(params[:id])
        authorize observation_list, :export?

        result = ::Dna::PdfExporter.call(observation_list: observation_list)
        if result.success?
          redirect_to admin_dna_observation_lists_path,
                      notice: "Created #{result.data[:artifacts].size} export artifacts."
        else
          redirect_to admin_dna_observation_lists_path,
                      alert: "Export failed: #{result.error}"
        end
      end

      def prune
        authorize ::Dna::ObservationList, :prune?

        result = ::Dna::ArtifactPruner.call
        if result.success?
          redirect_to admin_dna_observation_lists_path,
                      notice: "Pruned #{result.data[:removed]} old DNA export artifacts."
        else
          redirect_to admin_dna_observation_lists_path,
                      alert: "Prune failed: #{result.error}"
        end
      end

      private

      def observation_list_params
        params.require(:dna_observation_list).permit(
          :title,
          :description,
          :product_type,
          :export_mode,
          :state_code,
          :county_name,
          :inat_place_id,
          :place_query,
          :inat_project_id,
          :public_download
        )
      end
    end
  end
end
