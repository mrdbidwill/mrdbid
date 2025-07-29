class UpdateMbListsCollation < ActiveRecord::Migration[6.1] # Adjust version as necessary
  def up
    execute <<-SQL
      ALTER TABLE mb_lists
      CONVERT TO CHARACTER SET utf8mb4
      COLLATE utf8mb4_0900_as_cs;
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE mb_lists
      CONVERT TO CHARACTER SET utf8mb4
      COLLATE utf8mb4_0900_ai_ci; -- Default collation (or whichever collation was previously used)
    SQL
  end
end
