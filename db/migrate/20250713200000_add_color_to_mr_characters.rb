class AddColorToMrCharacters < ActiveRecord::Migration[8.0]
  def change
    add_reference :mr_characters, :color, foreign_key: true, null: true
  end
end
