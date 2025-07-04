# spec/requests/lookup_tables_request_spec.rb
RSpec.describe "Lookup Tables", type: :request do
  LookupTableConstants::LOOKUP_TABLES.each do |factory_name|
    context "#{factory_name.to_s.titleize} CRUD" do
      include_examples "lookup table CRUD", factory_name.to_s,
        -> { create(:source) },
        -> { attributes_for(factory_name) },
        -> { attributes_for(factory_name, name: nil) }
    end
  end
end
