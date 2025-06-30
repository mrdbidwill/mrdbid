class CreateMyceliumTextures < ActiveRecord::Migration[8.0]
  def change
    create_table :mycelium_textures do |t|
      t.string :name
      t.text :description
      t.text :comments
      t.integer :source

      t.timestamps
    end
  end
end
