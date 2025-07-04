class CreatePileusShapeTopViews < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:pileus_shape_top_views)

    create_table :pileus_shape_top_views do |t|
      t.string :name, null: false
      t.text :description
      t.text :comments
      t.integer :source, null: false
      t.timestamps
    end
  end
end
