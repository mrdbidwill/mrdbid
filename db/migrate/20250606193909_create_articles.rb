class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.references :entered_by, null: false, foreign_key: {to_table: :users}
      t.string :title
      t.text :body
      t.timestamps
    end
  end
end
