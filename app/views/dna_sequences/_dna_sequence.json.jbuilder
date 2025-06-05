json.extract! dna_sequence, :id, :name, :description, :comments, :source_id, :entered_by_id, :created_at, :updated_at
json.url dna_sequence_url(dna_sequence, format: :json)
