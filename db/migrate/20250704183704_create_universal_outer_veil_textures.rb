class CreateUniversalOuterVeilTextures < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:universal_outer_veil_textures)

    create_table :universal_outer_veil_textures do |t|
      t.string :name, null: false
      t.text :description
      t.text :comments
      t.integer :source, null: false
      t.timestamps
    end
  end
end
