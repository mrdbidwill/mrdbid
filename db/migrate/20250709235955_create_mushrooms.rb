# frozen_string_literal: true

class CreateMushrooms < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:mushrooms)

    create_table :mushrooms do |t|
      t.string :name
      t.text :description
      t.text :comments
      t.references :user, foreign_key: false    # Foreign key added in a separate migration

      t.timestamps
    end
  end
end
