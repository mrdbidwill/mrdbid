class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :name, null: false # A placeholder name for now
      t.string :email, null: false # The unique constraint will come from an index
      t.timestamps
    end

    # Add a unique index to the email column to enforce uniqueness
    add_index :users, :email, unique: true
  end
end
