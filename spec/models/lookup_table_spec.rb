# spec/models/lookup_table_spec.rb
# # This spec validates the behavior, validations, and relationships for lookup table models.
# # To ensure that all factories are valid, see spec/models/factory_consistency_spec.rb.

require "rails_helper"

RSpec.describe "Lookup Table Models", type: :model do
  include LookupTableConstants

  LookupTableConstants::LOOKUP_TABLES.each do |table_name|
    context "testing #{table_name.to_s.singularize.camelize}" do
      let(:model_class) { "LookupTables::#{table_name.to_s.singularize.camelize}".constantize }

      it_behaves_like "a lookup table" do
        let(:subject) { build(table_name.to_s.singularize.to_sym) }
      end
    end
  end
end
