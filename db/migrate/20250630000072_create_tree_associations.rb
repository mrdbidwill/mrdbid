class CreateTreeAssociations < ActiveRecord::Migration[8.0]
  def change
    create_table :tree_associations do |t|
      t.references :mushroom, null: false, foreign_key: false# Foreign key added in a separate migration
      t.references :tree, foreign_key:  { to_table: :lookup_items } # Points to lookup_items instead of trees
      t.timestamps
    end
  end
end
