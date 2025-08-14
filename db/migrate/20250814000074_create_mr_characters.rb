# Creates the mr_characters table
# frozen_string_literal: true

class CreateMrCharacters < ActiveRecord::Migration[8.0]
  def change
  create_table :mr_characters do |t|
      t.string :name
      t.references :part, foreign_key: true 
      t.references :lookup_type, foreign_key: true 
      t.references :display_option, foreign_key: true 
      t.references :source_data, foreign_key: true
      t.timestamps
    end
  end
end
