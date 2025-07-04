# spec/views/lookup_tables_views_spec.rb
RSpec.describe "Lookup Table Views", type: :view do
  include LookupTableConstants

  LOOKUP_TABLES.each do |factory_name|
    let(:resource) { create(factory_name) }

    it "renders index correctly for #{factory_name}" do
      assign(:resources, [resource])
      render template: "lookup_tables/index"
      expect(rendered).to include(resource.name)
    end

    it "renders show correctly for #{factory_name}" do
      assign(:resource, resource)
      render template: "lookup_tables/show"
      expect(rendered).to include(resource.name, resource.description)
    end
  end
end
