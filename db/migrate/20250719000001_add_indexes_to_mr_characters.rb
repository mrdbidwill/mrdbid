class AddIndexesToMrCharacters < ActiveRecord::Migration[8.0]
  def change
    # Add index for lookup_type_id
    add_index :mr_characters, :lookup_type_id unless index_exists?(:mr_characters, :lookup_type_id)

    # Add index for part_id
    add_index :mr_characters, :part_id unless index_exists?(:mr_characters, :part_id)

    # Add index for display_option_id
    add_index :mr_characters, :display_option_id unless index_exists?(:mr_characters, :display_option_id)

    # Add index for source_data_id
    add_index :mr_characters, :source_data_id unless index_exists?(:mr_characters, :source_data_id)

    # Add index for name if frequently queried or for uniqueness
    add_index :mr_characters, :name, unique: true unless index_exists?(:mr_characters, :name)
  end

  add_index :mr_characters, [:lookup_type_id, :part_id] unless index_exists?(:mr_characters, [:lookup_type_id, :part_id])
end

