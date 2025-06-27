RSpec.shared_examples "lookup table CRUD" do |resource_name, source_proc, valid_attributes_proc, invalid_attributes_proc|
  let(:valid_attributes) { valid_attributes_proc.call.merge(source: source_proc.call.id) }
  let(:invalid_attributes) { invalid_attributes_proc.call.merge(source: source_proc.call.id) }

  describe "GET #index" do
    it "renders a successful response" do
      create(resource_name.underscore.to_sym, valid_attributes)
      get send("#{resource_name.underscore.pluralize}_path")
      expect(response).to be_successful
    end
  end

  # Add other tests for POST, CREATE, DELETE, etc.
end
