class AddForeignKeysToMrCharacters < ActiveRecord::Migration[8.0]
  def change
    # Ensure these match your actual database column names
    unless foreign_key_exists?(:mr_characters, :lookup_items, column: :display_option_id)
      add_foreign_key :mr_characters, :lookup_items, column: :display_option_id
    end

    unless foreign_key_exists?(:mr_characters, :lookup_items, column: :part_id)
      add_foreign_key :mr_characters, :lookup_items, column: :part_id
    end

    unless foreign_key_exists?(:mr_characters, :source_data, column: :source_data_id)
      add_foreign_key :mr_characters, :source_data, column: :source_data_id
    end
  end
end

