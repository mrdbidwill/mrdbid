class CreateProjectBelongsTos < ActiveRecord::Migration[8.0]
  def change
    return if table_exists?(:project_belongs_tos)

    create_table :project_belongs_tos do |t|
      t.string :name, null: false
      t.text :description
      t.text :comments
      t.integer :source, null: false
      t.timestamps
    end
  end
end
