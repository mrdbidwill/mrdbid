# frozen_string_literal: true

class CreateLookupItems < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:lookup_items)

    create_table :lookup_items do |t|
      t.references :lookup_type, null: false, foreign_key: false # Foreign key added in a separate migration
      t.string :name
      t.text :description
      t.text :comments
      t.references :parent, foreign_key: { to_table: :lookup_items }, null: true # Self-referencing parent column


      t.timestamps
    end
  end
end

