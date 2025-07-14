# frozen_string_literal: true

class CreateSourceData < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:source_data)

    create_table :source_data do |t|
      t.string :title
      t.string :author
      t.string :ref
      t.string :item_code
      t.references :source_data_type, foreign_key:  { to_table: :lookup_items } # Points to lookup_items instead of source_data_types
      t.text :comment

      t.timestamps
    end
  end
end
