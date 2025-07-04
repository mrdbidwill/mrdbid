class CreateToxics < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:toxics)

    create_table :toxics do |t|
      t.string :name, null: false
      t.text :description
      t.text :comments
      t.integer :source, null: false
      t.timestamps
    end
  end
end
