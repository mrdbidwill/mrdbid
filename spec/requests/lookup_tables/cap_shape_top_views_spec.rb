require "rails_helper"
require "support/shared_examples/lookup_request_examples"

RSpec.describe "/lookup_tables/cap_shape_top_view", type: :request do
  let(:source) { create(:source) }  # Use 'let' instead of '@source'

  it_behaves_like "lookup table CRUD", "CapShapeTopView", -> { {name: "CapShapeTopView", source: source.id} }, -> { {name: nil, source: source.id} }
end
