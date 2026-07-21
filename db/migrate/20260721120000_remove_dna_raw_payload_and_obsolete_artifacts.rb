# frozen_string_literal: true

class RemoveDnaRawPayloadAndObsoleteArtifacts < ActiveRecord::Migration[8.0]
  def up
    remove_column :dna_observations, :raw_payload, :text, limit: 4.gigabytes - 1

    execute <<~SQL.squish
      DELETE FROM dna_export_artifacts
      WHERE kind NOT IN ('observations_index_pdf', 'genera_count')
    SQL

    execute <<~SQL.squish
      DELETE older FROM dna_export_artifacts older
      INNER JOIN dna_export_artifacts newer
        ON newer.observation_list_id = older.observation_list_id
       AND newer.kind = older.kind
       AND newer.id > older.id
    SQL
  end

  def down
    add_column :dna_observations, :raw_payload, :text, limit: 4.gigabytes - 1
  end
end
