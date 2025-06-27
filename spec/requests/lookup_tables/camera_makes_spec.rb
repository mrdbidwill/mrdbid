require "rails_helper"
require "support/shared_examples/lookup_request_examples"

RSpec.describe "/lookup_tables/camera_makes", type: :request do
  let(:source) { create(:source) }  # Use 'let' instead of '@source'

  it_behaves_like "lookup table CRUD", "CameraMake", -> { {name: "CameraMake", source: source.id} }, -> { {name: nil, source: source.id} }
end
