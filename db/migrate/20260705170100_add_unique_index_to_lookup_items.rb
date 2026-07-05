# frozen_string_literal: true

class AddUniqueIndexToLookupItems < ActiveRecord::Migration[8.0]
  def up
    execute <<~SQL.squish
      DELETE FROM lookup_items
      WHERE mr_character_id IS NULL OR name IS NULL OR TRIM(name) = ''
    SQL

    execute <<~SQL.squish
      DELETE duplicate_rows
      FROM lookup_items duplicate_rows
      INNER JOIN lookup_items keeper
        ON keeper.mr_character_id = duplicate_rows.mr_character_id
       AND LOWER(keeper.name) = LOWER(duplicate_rows.name)
       AND keeper.id < duplicate_rows.id
    SQL

    change_column_null :lookup_items, :name, false

    add_index :lookup_items,
              [:mr_character_id, :name],
              unique: true,
              name: "index_lookup_items_on_character_and_name"
  end

  def down
    remove_index :lookup_items, name: "index_lookup_items_on_character_and_name"
    change_column_null :lookup_items, :name, true
  end
end
