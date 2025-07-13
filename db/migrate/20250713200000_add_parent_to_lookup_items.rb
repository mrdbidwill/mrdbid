class AddParentToLookupItems < ActiveRecord::Migration[8.0]
  def change
    add_reference :lookup_items, :parent, foreign_key: { to_table: :lookup_items }, null: true
    # This allows storing hierarchical relationships
  end
end