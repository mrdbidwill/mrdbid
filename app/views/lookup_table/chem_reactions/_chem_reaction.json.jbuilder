json.extract! chem_reaction, :id, :name, :description, :comments, :source, :created_at, :updated_at
json.url chem_reaction_url(chem_reaction, format: :json)
