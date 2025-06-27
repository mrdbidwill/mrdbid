class CreateSources < ActiveRecord::Migration[8.0]
  def change
    create_table :sources do |t|
      t.string :title
      t.string :author
      t.string :ref
      t.string :item_code
      t.integer :source_data_type
      t.text :comment
      t.integer :my_rating
      t.text :my_comment

      t.timestamps
    end
  end
end
