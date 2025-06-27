require "rails_helper"
require "support/shared_examples/lookup_request_examples"

RSpec.describe "/lookup_tables/all_groups", type: :request do
  let(:source) { create(:source) }  # Use 'let' instead of '@source'

  it_behaves_like "lookup table CRUD", "AllGroups", -> { {name: "AllGroup", source: source.id} }, -> { {name: nil, source: source.id} }
end
