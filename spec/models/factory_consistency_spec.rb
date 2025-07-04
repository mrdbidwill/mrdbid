# spec/models/factory_consistency_spec.rb
# # This spec ensures that all factories in LookupTableConstants are defined and produce valid objects.
# # For detailed model behavior and validation tests, see spec/models/lookup_table_spec.rb.

require "rails_helper"

RSpec.describe "Factory Consistency for Lookup Tables" do
  include LookupTableConstants

  LookupTableConstants::LOOKUP_TABLES.each do |table_name|
    it "has a valid factory for #{table_name}" do
      expect(build(table_name.to_s.singularize.to_sym)).to be_valid
    end
  end
end
