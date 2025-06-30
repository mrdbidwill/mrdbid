# spec/requests/lookup_tables_controller_spec.rb
require "rails_helper"

RSpec.describe LookupTablesController, type: :request do
  let(:table_name) { "abundances" }
  let!(:record) { LookupTables::Abundance.create!(name: "Abundance 1", description: "Description", source: "Source") }

  describe "GET #index" do
    it "returns success" do
      get "/lookup_tables/#{table_name}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns success" do
      get "/lookup_tables/#{table_name}/#{record.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "creates a new record" do
      post "/lookup_tables/#{table_name}", params: {abundance: {name: "New Abundance", description: "New desc", source: "New source"}}
      expect(response).to redirect_to(polymorphic_path(LookupTables::Abundance))
      expect(LookupTables::Abundance.last.name).to eq("New Abundance")
    end
  end

  # Add similar specs for `edit`, `update`, and `destroy` actions
end
