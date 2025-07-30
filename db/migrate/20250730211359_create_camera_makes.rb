class CreateCameraMakes < ActiveRecord::Migration[8.0]
  def change
    create_table :camera_makes do |t|
      t.timestamps
    end
  end
end
