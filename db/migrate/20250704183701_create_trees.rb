class CreateTrees < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:trees)

    create_table :trees do |t|
      t.string :name, null: false
      t.text :description
      t.text :comments
      t.integer :source, null: false
      t.timestamps
    end
  end
end
