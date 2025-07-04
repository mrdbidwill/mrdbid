class CreateRhizomorphTextures < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:rhizomorph_textures)

    create_table :rhizomorph_textures do |t|
      t.string :name, null: false
      t.text :description
      t.text :comments
      t.integer :source, null: false
      t.timestamps
    end
  end
end
