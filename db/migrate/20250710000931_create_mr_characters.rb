# Creates the mr_characters table
# frozen_string_literal: true

class CreateMrCharacters < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:mr_characters)

    create_table :mr_characters do |t|
      t.string :name
      t.references :part, foreign_key: false # Foreign key added in a separate migration
      t.references :lookup_type, foreign_key: false # Foreign key added in a separate migration
      t.references :display_option, foreign_key: false # Foreign key added in a separate migration
      t.references :source_data, foreign_key: false# Foreign key added in a separate migration

      t.timestamps
    end
  end
end
