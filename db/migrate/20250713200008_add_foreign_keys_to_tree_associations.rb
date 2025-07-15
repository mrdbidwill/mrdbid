class AddForeignKeysToTreeAssociations < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :tree_associations, :mushrooms
    add_foreign_key :tree_associations, :lookup_items, column: :tree_id
  end
end
