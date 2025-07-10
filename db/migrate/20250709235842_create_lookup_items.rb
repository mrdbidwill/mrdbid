# frozen_string_literal: true

class CreateLookupItems < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:lookup_items)

    create_table :lookup_items do |t|
      t.string :type
      t.string :name
      t.text :description
      t.text :comments

      t.timestamps
    end
    add_index :lookup_items, :name
  end
end
