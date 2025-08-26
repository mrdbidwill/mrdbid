# app/controllers/admin/utility_controller.rb
class Admin::UtilityController < Admin::ApplicationController
  def export_database
    # Logic to create a database dump
    system("pg_dump -Fc --file=backup.dump #{Rails.configuration.database_configuration[Rails.env]['database']}")
    redirect_to admin_root_path, notice: "Database exported successfully."
  end

  def run_scripts
    # Logic to repopulate genus/species
    Genus.populate_from_mb_lists
    Species.populate_from_mb_lists
    redirect_to admin_root_path, notice: "Genus and species updated."
  end
end