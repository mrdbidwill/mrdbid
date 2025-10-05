class RenameTaxonNameToNameInGeneraAndSpecies < ActiveRecord::Migration[8.0]
  def change
    rename_column :genera, :taxon_name, :name
    rename_column :species, :taxon_name, :name
  end
end
