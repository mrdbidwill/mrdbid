class AddForeignKeysToMrCharacters < ActiveRecord::Migration[8.0]
  def change
    # Ensure these match your actual database column names

    unless foreign_key_exists?(:mr_characters, :parts)
      add_foreign_key :mr_characters, :parts
    end


    unless foreign_key_exists?(:mr_characters, :lookup_types)
      add_foreign_key :mr_characters, :lookup_types
    end

    unless foreign_key_exists?(:mr_characters, :display_options)
      add_foreign_key :mr_characters, :display_options
    end

    unless foreign_key_exists?(:mr_characters, :source_data)
      add_foreign_key :mr_characters, :source_data, column: :source_data_id
    end
  end
end

