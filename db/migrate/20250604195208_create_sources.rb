class CreateSources < ActiveRecord::Migration[8.0]
  def change
    create_table :sources do |t|
      t.string :title
      t.string :author
      t.string :ref
      t.string :item_code
      t.text :comment
      t.integer :my_rating
      t.text :my_comment
      t.references :entered_by, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
