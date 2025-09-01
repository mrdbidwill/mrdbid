class AddDescriptionAndCommentsToMrCharacters < ActiveRecord::Migration[8.0]
  def change
    if connection.adapter_name.downcase.include?("mysql")
      # Keep physical order after `name` on MySQL
      execute <<~SQL
        ALTER TABLE mr_characters
          ADD COLUMN description TEXT AFTER name,
          ADD COLUMN comments    TEXT AFTER description;
      SQL
    else
      # Portable approach for other databases (column order is not guaranteed/important)
      add_column :mr_characters, :description, :text
      add_column :mr_characters, :comments,    :text
    end

    # Optional: add DB-level column comments (supported by MySQL/Postgres adapters)
    change_column_comment :mr_characters, :description, "Human-readable description of the character"
    change_column_comment :mr_characters, :comments,    "Internal notes/comments for the character"
  end
end