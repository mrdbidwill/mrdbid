class CreateDisplayOptions < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:display_options)

    create_table :display_options do |t|
      t.string :name, null: false
      t.text :description
      t.text :comments
      t.integer :source, null: false
      t.timestamps
    end
  end
end
