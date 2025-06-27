require "rails_helper"
require "support/shared_examples/lookup_request_examples"

RSpec.describe "/lookup_tables/stem_interiors", type: :request do
  let(:source) { create(:source) }  # Use 'let' instead of '@source'

  it_behaves_like "lookup table CRUD", "StemInterior", -> { {name: "StemInterior", source: source.id} }, -> { {name: nil, source: source.id} }
end
