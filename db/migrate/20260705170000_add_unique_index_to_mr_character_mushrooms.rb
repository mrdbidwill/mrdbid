# frozen_string_literal: true

class AddUniqueIndexToMrCharacterMushrooms < ActiveRecord::Migration[8.0]
  def up
    execute <<~SQL.squish
      DELETE FROM mr_character_mushrooms
      WHERE mushroom_id IS NULL OR mr_character_id IS NULL
    SQL

    execute <<~SQL.squish
      DELETE duplicate_rows
      FROM mr_character_mushrooms duplicate_rows
      INNER JOIN mr_character_mushrooms keeper
        ON keeper.mushroom_id = duplicate_rows.mushroom_id
       AND keeper.mr_character_id = duplicate_rows.mr_character_id
       AND keeper.id < duplicate_rows.id
    SQL

    change_column_null :mr_character_mushrooms, :mushroom_id, false
    change_column_null :mr_character_mushrooms, :mr_character_id, false

    add_index :mr_character_mushrooms,
              [:mushroom_id, :mr_character_id],
              unique: true,
              name: "index_mcm_on_mushroom_and_character"
  end

  def down
    remove_index :mr_character_mushrooms, name: "index_mcm_on_mushroom_and_character"
    change_column_null :mr_character_mushrooms, :mushroom_id, true
    change_column_null :mr_character_mushrooms, :mr_character_id, true
  end
end
