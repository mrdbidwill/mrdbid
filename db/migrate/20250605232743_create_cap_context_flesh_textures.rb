class CreateCapContextFleshTextures < ActiveRecord::Migration[8.0]
  def change
    create_table :cap_context_flesh_textures do |t|
      t.string :name
      t.text :description
      t.text :comments
      t.references :source, null: false, foreign_key: true
      t.references :entered_by, null: false, foreign_key: true

      t.timestamps
    end
  end
end
