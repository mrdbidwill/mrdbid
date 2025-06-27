class CreateCapShapeTopViews < ActiveRecord::Migration[8.0]
  def change
    create_table :cap_shape_top_views do |t|
      t.string :name
      t.text :description
      t.text :comments
      t.integer :source
      t.timestamps
    end
  end
end
