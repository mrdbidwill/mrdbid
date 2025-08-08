# frozen_string_literal: true

class CreateSourceData < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:source_data)

    create_table :source_data do |t|
      t.string :title
      t.string :author
      t.string :ref
      t.string :item_code
      t.references :source_data_type, foreign_key: false # Foreign key added in a separate migration
      t.text :comments

      t.timestamps
    end
  end
end
