class CreatePileusMarginShapes < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:pileus_margin_shapes)

    create_table :pileus_margin_shapes do |t|
      t.string :name, null: false
      t.text :description
      t.text :comments
      t.integer :source, null: false
      t.timestamps
    end
  end
end
