class AddForeignKeysToDnaSequences < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :dna_sequences, :mushrooms
  end
end
