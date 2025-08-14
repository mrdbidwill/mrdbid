# frozen_string_literal: true

class CreateMushrooms < ActiveRecord::Migration[8.0]
  def change
  create_table :mushrooms do |t|
      t.string :name
      t.text :description
      t.text :comments
      t.references :user, foreign_key: { on_delete: :cascade }
      t.references :country, foreign_key: true
      t.references :state, foreign_key: true
      t.references :fungus_type
      t.timestamps
  end
  add_index :mushrooms, [:user_id, :name], unique: true
  end
end
