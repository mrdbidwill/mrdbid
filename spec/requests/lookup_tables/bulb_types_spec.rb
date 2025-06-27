require "rails_helper"
require "support/shared_examples/lookup_request_examples"

RSpec.describe "/lookup_tables/bulb_types", type: :request do
  let(:source) { create(:source) }  # Use 'let' instead of '@source'

  it_behaves_like "lookup table CRUD", "BulbType", -> { {name: "BulbType", source: source.id} }, -> { {name: nil, source: source.id} }
end
