class AddForeignKeyToLookupItems < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :lookup_items, :mr_characters, column: :mr_character_id
  end
end
