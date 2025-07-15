# Creates the mr_characters table
# frozen_string_literal: true

class CreateMrCharacters < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:mr_characters)

    create_table :mr_characters do |t|
      t.string :name
      t.references :display_option, null: false, foreign_key: false # Foreign key added in a separate migration
      t.references :part, null: false, foreign_key: false # Foreign key added in a separate migration
      t.references :source_data, null: false, foreign_key: false# Foreign key added in a separate migration

      t.timestamps
    end
  end
end
