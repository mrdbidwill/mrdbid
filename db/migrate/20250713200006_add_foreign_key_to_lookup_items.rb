class AddForeignKeyToLookupItems < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :lookup_items, :lookup_types
  end
end
