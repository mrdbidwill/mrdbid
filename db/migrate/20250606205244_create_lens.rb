class CreateLens < ActiveRecord::Migration[8.0]
  def change
    create_table :lens do |t|
      t.string :lens_make, null: false
      t.string :lens_model
      t.references :entered_by, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
