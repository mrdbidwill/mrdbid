class AddLookupTypeToLookupItems < ActiveRecord::Migration[8.0]
  def change
    add_reference :lookup_items, :lookup_type, foreign_key: true, null: true
    remove_column :lookup_items, :type, :string
  end
end
