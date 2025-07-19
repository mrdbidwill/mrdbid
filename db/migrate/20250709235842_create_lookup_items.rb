# frozen_string_literal: true

class CreateLookupItems < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:lookup_items)

    create_table :lookup_items do |t|
      t.references :mr_character, foreign_key: false
      t.string :name
      t.text :description
      t.text :comments
      t.references :data_source, foreign_key: false

      t.timestamps
    end
  end
end

