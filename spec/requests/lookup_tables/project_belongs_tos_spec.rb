require "rails_helper"
require "support/shared_examples/lookup_request_examples"

RSpec.describe "/lookup_tables/project_belongs_tos", type: :request do
  let(:source) { create(:source) }  # Use 'let' instead of '@source'

  it_behaves_like "lookup table CRUD", "ProjectBelongsTo", -> { {name: "ProjectBelongsTo", source: source.id} }, -> { {name: nil, source: source.id} }
end
