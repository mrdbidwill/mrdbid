# frozen_string_literal: true

class MakeDnaExportsIndexOnly < ActiveRecord::Migration[8.0]
  def up
    change_column_default :dna_observation_lists, :export_mode, from: "full", to: "index_only"
    execute "UPDATE dna_observation_lists SET export_mode = 'index_only' WHERE export_mode <> 'index_only'"
  end

  def down
    change_column_default :dna_observation_lists, :export_mode, from: "index_only", to: "full"
  end
end
