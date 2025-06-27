class CreateColors < ActiveRecord::Migration[8.0]
  def change
    create_table :colors do |t|
      t.string :latin_name
      t.string :common_name
      t.integer :color_group
      t.string :hex
      t.integer :sequence_number
      t.integer :r_val
      t.integer :g_val
      t.integer :b_val
      t.string :closest_websafe_color
      t.integer :cwc_r
      t.integer :cwc_g
      t.integer :cwc_b
      t.string :image_file
      t.timestamps
    end
  end
end
