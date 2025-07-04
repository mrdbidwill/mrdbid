class CreateCameraMakes < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:camera_makes)

    create_table :camera_makes do |t|
      t.string :name, null: false
      t.text :description
      t.text :comments
      t.integer :source, null: false
      t.timestamps
    end
  end
end
