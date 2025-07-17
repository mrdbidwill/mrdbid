class CreateStates < ActiveRecord::Migration[8.0]
  def change
    create_table :states do |t|
      t.string :name
      t.text :description
      t.text :comments
      t.references :country, null: false, foreign_key: false

      t.timestamps
    end
  end
end
