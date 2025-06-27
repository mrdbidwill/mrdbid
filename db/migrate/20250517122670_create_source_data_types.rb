class CreateSourceDataTypes < ActiveRecord::Migration[8.0]
  def change
    create_table :source_data_types do |t|
      t.string :name, null: false
      t.text :description, null: true
      t.text :comments, null: true

      t.timestamps
    end
  end
end
