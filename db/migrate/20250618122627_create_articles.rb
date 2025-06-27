class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :author
      t.string :ref
      t.string :item_code
      t.text :comment
      t.integer :my_rating
      t.text :my_comment
      t.timestamps
    end
  end
end
