class AddIndexesAndConstraintsToGeneraAndSpecies < ActiveRecord::Migration[8.0]
  def change
    add_index :genera, :taxon_name, unique: true unless index_exists?(:genera, :taxon_name)
    add_index :species, [:genera_id, :taxon_name], unique: true unless index_exists?(:species, [:genera_id, :taxon_name])
    add_index :mushroom_species, [:mushroom_id, :species_id], unique: true unless index_exists?(:mushroom_species, [:mushroom_id, :species_id])
    add_index :genus_mushrooms, [:mushroom_id, :genus_id], unique: true unless index_exists?(:genus_mushrooms, [:mushroom_id, :genus_id])
  end
end
