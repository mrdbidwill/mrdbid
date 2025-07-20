class AddIndexesToMrCharacters < ActiveRecord::Migration[8.0]
  def change
    # Add index to lookup_type_id if it doesn't exist
    unless index_exists?(:mr_characters, :lookup_type_id)
      add_index :mr_characters, :lookup_type_id
    end

    # Add index to part_id if it doesn't exist
    unless index_exists?(:mr_characters, :part_id)
      add_index :mr_characters, :part_id
    end
  end
end

