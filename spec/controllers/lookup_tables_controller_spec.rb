# spec/controllers/lookup_tables_controller_spec.rb
require "rails_helper"

RSpec.describe LookupTablesController, type: :controller do
  include LookupTableConstants

  LookupTableConstants::LOOKUP_TABLES.each do |table_name|
    context "for #{table_name}" do
      let(:resource_class) { "LookupTables::#{table_name.to_s.singularize.camelize}".constantize }
      let!(:resource) { create(table_name.to_s.singularize.to_sym) }

      before do
        # Simulating the dynamic table name being passed
        allow(controller).to receive(:params).and_return({table_name: table_name})
        # Simulating the dynamic assignment of @resource_class
        allow(controller).to receive(:set_resource_class).and_call_original
      end

      it "prints debug information" do
        puts "Processing table_name: #{table_name}"
        puts "Expected resource_class: LookupTables::#{table_name.to_s.singularize.camelize}"
      end

      describe "GET #index" do
        it "assigns the correct resource_class and renders the index template" do
          get :index, params: {table_name: table_name}

          expect(assigns(:resources)).to include(resource)
          expect(assigns(:resources).map(&:source)).to include("Custom Source") # Ensures source is set
          expect(response).to render_template("lookup_tables/index")
        end
      end

      # Additional controller tests for CRUD actions can be added here
    end
  end
end
