class CreateLamellaSpacings < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:lamella_spacings)

    create_table :lamella_spacings do |t|
      t.string :name, null: false
      t.text :description
      t.text :comments
      t.integer :source, null: false
      t.timestamps
    end
  end
end
