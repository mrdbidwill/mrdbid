class CreateTreeAssociations < ActiveRecord::Migration[8.0]
  def change
    create_table :tree_associations do |t|
      t.references :mushroom, foreign_key: false# Foreign key added in a separate migration
      t.references :tree, foreign_key: false # Foreign key added in a separate migration
      t.timestamps
    end
  end
end
