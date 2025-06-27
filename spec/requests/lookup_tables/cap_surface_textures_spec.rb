require "rails_helper"
require "support/shared_examples/lookup_request_examples"

RSpec.describe "/lookup_tables/cap_surface_texture", type: :request do
  let(:source) { create(:source) }  # Use 'let' instead of '@source'

  it_behaves_like "lookup table CRUD", "CapSurfaceTexture", -> { {name: "CapSurfaceTexture", source: source.id} }, -> { {name: nil, source: source.id} }
end
