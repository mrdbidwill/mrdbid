class CreateMushroomProjects < ActiveRecord::Migration[8.0]
  def change
    create_table :mushroom_projects do |t|
      t.references :mushroom, foreign_key: true
      t.references :project, foreign_key: true
      t.timestamps
    end
  end
end