# frozen_string_literal: true

class CreateMushrooms < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:mushrooms)

    create_table :mushrooms do |t|
      t.string :name
      t.text :description
      t.text :comment
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :mushrooms, :name
  end
end
