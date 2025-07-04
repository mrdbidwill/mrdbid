class CreateLamellaEdges < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:lamella_edges)

    create_table :lamella_edges do |t|
      t.string :name, null: false
      t.text :description
      t.text :comments
      t.integer :source, null: false
      t.timestamps
    end
  end
end
