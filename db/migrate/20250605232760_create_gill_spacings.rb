class CreateGillSpacings < ActiveRecord::Migration[8.0]
  def change
    create_table :gill_spacings do |t|
      t.string :name
      t.text :description
      t.text :comments
      t.references :source, null: false, foreign_key: true
      t.references :entered_by, null: false, foreign_key: true

      t.timestamps
    end
  end
end
