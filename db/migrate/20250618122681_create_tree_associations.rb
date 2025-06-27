class CreateTreeAssociations < ActiveRecord::Migration[8.0]
  def change
    create_table :tree_associations do |t|
      t.references :mushroom, null: false, foreign_key: true
      t.references :tree, null: false, foreign_key: true

      t.timestamps
    end
  end
end
