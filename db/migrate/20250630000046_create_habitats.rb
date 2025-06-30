class CreateHabitats < ActiveRecord::Migration[8.0]
  def change
    create_table :habitats do |t|
      t.string :name
      t.text :description
      t.text :comments
      t.integer :source

      t.timestamps
    end
  end
end
