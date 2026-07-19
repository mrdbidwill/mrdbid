# frozen_string_literal: true

namespace :dna do
  desc "Seed Rails DNA county and project observation lists"
  task seed_observation_lists: :environment do
    result = Dna::ObservationListSeeder.call

    if result.success?
      result.data.each do |key, value|
        puts "#{key}: #{value}"
      end
      puts "total_counties: #{Dna::ObservationList.where(product_type: 'county', state_code: 'AL').count}"
      puts "total_projects: #{Dna::ObservationList.where(product_type: 'project').count}"
    else
      warn "DNA observation list seed failed: #{result.error}"
      exit 1
    end
  end

  desc "Sync and export AMS Sequenced Specimens index-only DNA artifacts"
  task build_ams_index: :environment do
    observation_list = Dna::ObservationList.find_by(
      product_type: "project",
      inat_project_id: Dna::InaturalistClient::DEFAULT_AMS_PROJECT_ID
    )

    unless observation_list
      warn "AMS Sequenced Specimens list is missing. Run rails dna:seed_observation_lists first."
      exit 1
    end

    sync_result = Dna::ObservationSyncer.call(observation_list: observation_list)
    unless sync_result.success?
      warn "AMS sync failed: #{sync_result.error}"
      exit 1
    end

    export_result = Dna::PdfExporter.call(observation_list: observation_list)
    unless export_result.success?
      warn "AMS export failed: #{export_result.error}"
      exit 1
    end

    puts "synced_observations: #{sync_result.data[:count]}"
    puts "created_artifacts: #{export_result.data[:artifacts].size}"
  end

  desc "Seed, sync, and export every public DNA index"
  task build_public_indexes: :environment do
    seed_result = Dna::ObservationListSeeder.call
    unless seed_result.success?
      warn "DNA observation list seed failed: #{seed_result.error}"
      exit 1
    end

    lists = Dna::ObservationList.public_downloads.ordered
    puts "public_lists: #{lists.count}"

    lists.each do |observation_list|
      puts "syncing: #{observation_list.title}"
      sync_result = Dna::ObservationSyncer.call(observation_list: observation_list)
      unless sync_result.success?
        warn "Sync failed for #{observation_list.title}: #{sync_result.error}"
        exit 1
      end

      export_result = Dna::PdfExporter.call(observation_list: observation_list)
      unless export_result.success?
        warn "Export failed for #{observation_list.title}: #{export_result.error}"
        exit 1
      end

      puts "synced_observations: #{sync_result.data[:count]}"
      puts "created_artifacts: #{export_result.data[:artifacts].size}"
    end
  end
end
