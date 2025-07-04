# spec/routing/lookup_tables_routing_spec.rb
require "rails_helper"
require_relative "../support/lookup_table_constants"

RSpec.describe "Lookup Table Routes", type: :routing do
  include LookupTableConstants

  LOOKUP_TABLES.each do |table_name|
    it "routes to the #{table_name.singularize} index" do
      expect(get: "/#{table_name}").to route_to("lookup_tables#index", table_name: table_name)
    end

    it "routes to the #{table_name.singularize} show" do
      expect(get: "/#{table_name}/1").to route_to("lookup_tables#show", table_name: table_name, id: "1")
    end
  end
end
