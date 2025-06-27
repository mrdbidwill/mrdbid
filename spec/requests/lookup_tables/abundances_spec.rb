# spec/requests/lookup_tables/abundances_spec.rb
require "rails_helper" # Ensure test configuration is loaded

RSpec.describe "/lookup_tables/abundances", type: :request do
  describe "GET #index" do
    before do
      source = create(:source) # Using FactoryBot shortcut
      create(:abundance, source: source) # Using FactoryBot for association
    end

    it "renders a successful response" do
      get "/lookup_tables/abundances"
      expect(response).to be_successful
    end
  end
end
