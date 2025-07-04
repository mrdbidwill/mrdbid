class CreatePileusSurfaceTextures < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:pileus_surface_textures)

    create_table :pileus_surface_textures do |t|
      t.string :name, null: false
      t.text :description
      t.text :comments
      t.integer :source, null: false
      t.timestamps
    end
  end
end
