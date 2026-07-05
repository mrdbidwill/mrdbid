# frozen_string_literal: true

class CreateDnaExportArtifacts < ActiveRecord::Migration[8.0]
  def change
    create_table :dna_export_artifacts do |t|
      t.references :observation_list, null: false, foreign_key: { to_table: :dna_observation_lists }
      t.string :kind, null: false
      t.string :filename, null: false
      t.string :relative_path, null: false
      t.bigint :size_bytes, null: false, default: 0

      t.timestamps
    end

    add_index :dna_export_artifacts, :kind
    add_index :dna_export_artifacts, :created_at
  end
end
