require "rails_helper"

RSpec.describe SourceDataTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/source_data_types").to route_to("source_data_types#index")
    end

    it "routes to #new" do
      expect(get: "/source_data_types/new").to route_to("source_data_types#new")
    end

    it "routes to #show" do
      expect(get: "/source_data_types/1").to route_to("source_data_types#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/source_data_types/1/edit").to route_to("source_data_types#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/source_data_types").to route_to("source_data_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/source_data_types/1").to route_to("source_data_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/source_data_types/1").to route_to("source_data_types#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/source_data_types/1").to route_to("source_data_types#destroy", id: "1")
    end
  end
end
