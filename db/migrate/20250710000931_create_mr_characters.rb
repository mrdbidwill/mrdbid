# frozen_string_literal: true

class CreateMrCharacters < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:mr_characters)

    create_table :mr_characters do |t|
      t.string :name
      t.integer :display_option_id
      t.integer :part_id
      t.references :source_data, null: false, foreign_key: true

      t.timestamps
    end
    add_index :mr_characters, :name
    add_index :mr_characters, :display_option_id
    add_index :mr_characters, :part_id
  end
end
