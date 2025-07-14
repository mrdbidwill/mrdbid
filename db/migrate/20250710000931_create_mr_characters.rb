# Creates the mr_characters table
# frozen_string_literal: true

class CreateMrCharacters < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:mr_characters)

    create_table :mr_characters do |t|
      t.string :name
      t.references :display_option, foreign_key:  { to_table: :lookup_items } # Points to lookup_items instead of display_options
      t.references :part, foreign_key:  { to_table: :lookup_items } # Points to lookup_items instead of parts
      t.references :source_data, null: false, foreign_key: false# Foreign key added in a separate migration

      t.timestamps
    end
  end
end
