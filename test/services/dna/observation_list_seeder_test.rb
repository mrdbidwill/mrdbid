# frozen_string_literal: true

require "test_helper"

module Dna
  class ObservationListSeederTest < ActiveSupport::TestCase
    setup do
      Dna::ObservationList.destroy_all
    end

    test "seeds Alabama county lists and four project lists" do
      result = Dna::ObservationListSeeder.call

      assert result.success?, result.error
      assert_equal 67, Dna::ObservationList.where(product_type: "county", state_code: "AL").count
      assert_equal 4, Dna::ObservationList.where(product_type: "project").count

      baldwin = Dna::ObservationList.find_by!(title: "Baldwin County-AL")
      assert_equal "Baldwin County", baldwin.county_name
      assert_equal "Baldwin County, US, AL", baldwin.place_query
      assert_equal "full", baldwin.export_mode
      assert_predicate baldwin, :public_download?

      ams = Dna::ObservationList.find_by!(inat_project_id: "132913")
      assert_equal "AMS Sequenced Specimens", ams.title
      assert_equal "index_only", ams.export_mode
      assert_predicate ams, :public_download?

      inactive_projects = Dna::ObservationList.where(product_type: "project").where.not(inat_project_id: "132913")
      assert_equal 3, inactive_projects.count
      assert inactive_projects.all?(&:index_only?)
      assert inactive_projects.none?(&:public_download?)
    end

    test "is idempotent and restores managed attributes" do
      Dna::ObservationListSeeder.call

      ams = Dna::ObservationList.find_by!(inat_project_id: "132913")
      ams.update!(public_download: false, export_mode: "full", title: "Changed")

      result = Dna::ObservationListSeeder.call

      assert result.success?, result.error
      assert_equal 67, Dna::ObservationList.where(product_type: "county", state_code: "AL").count
      assert_equal 4, Dna::ObservationList.where(product_type: "project").count
      assert_equal 0, result.data[:counties_created]
      assert_equal 0, result.data[:projects_created]

      ams.reload
      assert_equal "AMS Sequenced Specimens", ams.title
      assert_equal "index_only", ams.export_mode
      assert_predicate ams, :public_download?
    end
  end
end
