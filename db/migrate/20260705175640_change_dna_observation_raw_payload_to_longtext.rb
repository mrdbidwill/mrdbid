class ChangeDnaObservationRawPayloadToLongtext < ActiveRecord::Migration[8.0]
  def change
    change_column :dna_observations, :raw_payload, :text, limit: 4.gigabytes - 1
  end
end
