# db/migrate/20250915000000_rename_lens_to_lenses.rb
class RenameLensToLenses < ActiveRecord::Migration[8.0]
  def change
    rename_table :lens, :lenses
  end
end