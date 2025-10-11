class AddIndexesAndConstraintsToGeneraAndSpecies < ActiveRecord::Migration[8.0]
  def up
    # Remove duplicate genera, keeping oldest
    execute <<-SQL
      DELETE g1 FROM genera g1
      INNER JOIN genera g2
      WHERE g1.taxon_name = g2.taxon_name AND g1.id > g2.id
    SQL

    # Remove duplicate species, keeping oldest
    execute <<-SQL
      DELETE s1 FROM species s1
      INNER JOIN species s2
      WHERE s1.genera_id = s2.genera_id AND s1.taxon_name = s2.taxon_name AND s1.id > s2.id
    SQL

    add_index :genera, :taxon_name, unique: true unless index_exists?(:genera, :taxon_name)
    add_index :species, [:genera_id, :taxon_name], unique: true unless index_exists?(:species, [:genera_id, :taxon_name])
    add_index :mushroom_species, [:mushroom_id, :species_id], unique: true unless index_exists?(:mushroom_species, [:mushroom_id, :species_id])
    add_index :genus_mushrooms, [:mushroom_id, :genus_id], unique: true unless index_exists?(:genus_mushrooms, [:mushroom_id, :genus_id])
  end

  def down
    remove_index :genera, :taxon_name if index_exists?(:genera, :taxon_name)
    remove_index :species, [:genera_id, :taxon_name] if index_exists?(:species, [:genera_id, :taxon_name])
    remove_index :mushroom_species, [:mushroom_id, :species_id] if index_exists?(:mushroom_species, [:mushroom_id, :species_id])
    remove_index :genus_mushrooms, [:mushroom_id, :genus_id] if index_exists?(:genus_mushrooms, [:mushroom_id, :genus_id])
  end
end
