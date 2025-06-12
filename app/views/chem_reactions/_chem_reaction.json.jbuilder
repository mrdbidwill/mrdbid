json.extract! chem_reaction, :id, :name, :description, :comments, :source_id, :entered_by_id, :created_at, :updated_at
json.url chem_reaction_url(chem_reaction, format: :json)
