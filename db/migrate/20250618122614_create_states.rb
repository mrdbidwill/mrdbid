class CreateStates < ActiveRecord::Migration[8.0]
  def change
    create_table :states do |t|
      t.string :name
      t.text :description
      t.text :comments
      t.integer :country

      t.timestamps
    end
  end
end
