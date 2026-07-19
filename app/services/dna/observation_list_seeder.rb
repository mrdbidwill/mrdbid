# frozen_string_literal: true

module Dna
  class ObservationListSeeder < ApplicationService
    ALABAMA_COUNTIES = [
      "Autauga County",
      "Baldwin County",
      "Barbour County",
      "Bibb County",
      "Blount County",
      "Bullock County",
      "Butler County",
      "Calhoun County",
      "Chambers County",
      "Cherokee County",
      "Chilton County",
      "Choctaw County",
      "Clarke County",
      "Clay County",
      "Cleburne County",
      "Coffee County",
      "Colbert County",
      "Conecuh County",
      "Coosa County",
      "Covington County",
      "Crenshaw County",
      "Cullman County",
      "Dale County",
      "Dallas County",
      "DeKalb County",
      "Elmore County",
      "Escambia County",
      "Etowah County",
      "Fayette County",
      "Franklin County",
      "Geneva County",
      "Greene County",
      "Hale County",
      "Henry County",
      "Houston County",
      "Jackson County",
      "Jefferson County",
      "Lamar County",
      "Lauderdale County",
      "Lawrence County",
      "Lee County",
      "Limestone County",
      "Lowndes County",
      "Macon County",
      "Madison County",
      "Marengo County",
      "Marion County",
      "Marshall County",
      "Mobile County",
      "Monroe County",
      "Montgomery County",
      "Morgan County",
      "Perry County",
      "Pickens County",
      "Pike County",
      "Randolph County",
      "Russell County",
      "Shelby County",
      "St. Clair County",
      "Sumter County",
      "Talladega County",
      "Tallapoosa County",
      "Tuscaloosa County",
      "Walker County",
      "Washington County",
      "Wilcox County",
      "Winston County"
    ].freeze

    PROJECTS = [
      {
        title: "Alabama First Provisionals",
        inat_project_id: "251751",
        description: "Collection of sequenced specimens for species first documented in Alabama.",
        public_download: false
      },
      {
        title: "AMS Fungal Diversity Project- Collection",
        inat_project_id: "124358",
        description: "Project for fungi being collected for the AMS Alabama Fungal Diversity Project.",
        public_download: false
      },
      {
        title: "Fungi of Alabama- AMS FunDiS Local Project",
        inat_project_id: "184305",
        description: "Collection project for the Fungal Diversity Survey local sequencing effort.",
        public_download: false
      },
      {
        title: "AMS Sequenced Specimens",
        inat_project_id: Dna::InaturalistClient::DEFAULT_AMS_PROJECT_ID,
        description: "Specimens sequenced by or for the Alabama Mushroom Society, added when splits are ready for shipment.",
        public_download: true
      }
    ].freeze

    def call
      counts = { counties_created: 0, counties_updated: 0, projects_created: 0, projects_updated: 0 }

      Dna::ObservationList.transaction do
        ALABAMA_COUNTIES.each do |county_name|
          created = seed_county(county_name)
          counts[created ? :counties_created : :counties_updated] += 1
        end

        PROJECTS.each do |project|
          created = seed_project(project)
          counts[created ? :projects_created : :projects_updated] += 1
        end
      end

      Result.success(counts)
    rescue StandardError => e
      Result.failure(e.message)
    end

    private

    def seed_county(county_name)
      observation_list = Dna::ObservationList.find_or_initialize_by(
        product_type: "county",
        state_code: "AL",
        county_name: county_name
      )
      created = observation_list.new_record?

      observation_list.assign_attributes(
        title: "#{county_name}-AL",
        description: [
          "Auto-generated county list.",
          "Place: #{county_name}, US, AL.",
          "Queries all AMS projects for DNA Barcode ITS observations."
        ].join(" "),
        export_mode: "index_only",
        public_download: true,
        place_query: "#{county_name}, US, AL",
        inat_project_id: nil
      )
      observation_list.save!
      created
    end

    def seed_project(project)
      observation_list = Dna::ObservationList.find_or_initialize_by(
        product_type: "project",
        inat_project_id: project.fetch(:inat_project_id)
      )
      created = observation_list.new_record?

      observation_list.assign_attributes(
        title: project.fetch(:title),
        description: [
          "Auto-generated project list.",
          project.fetch(:description),
          "Project: #{project.fetch(:inat_project_id)}."
        ].join(" "),
        export_mode: "index_only",
        public_download: project.fetch(:public_download),
        state_code: nil,
        county_name: nil,
        inat_place_id: nil,
        place_query: nil
      )
      observation_list.save!
      created
    end
  end
end
