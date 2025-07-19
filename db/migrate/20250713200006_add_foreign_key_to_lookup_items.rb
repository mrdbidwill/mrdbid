class AddForeignKeyToLookupItems < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :lookup_items, :mr_characters, column: :mr_character_id
    add_foreign_key :lookup_items, :source_data, column: :id
  end
end
