class AddForeignKeysToMrCharacters < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :mr_characters, :lookup_items, column: :display_options
    add_foreign_key :mr_characters, :lookup_items, column: :parts
    add_foreign_key :mr_characters, :source_data
  end
end
