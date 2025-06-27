require "rails_helper"

RSpec.describe PlantAssociationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/plant_associations").to route_to("plant_associations#index")
    end

    it "routes to #new" do
      expect(get: "/plant_associations/new").to route_to("plant_associations#new")
    end

    it "routes to #show" do
      expect(get: "/plant_associations/1").to route_to("plant_associations#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/plant_associations/1/edit").to route_to("plant_associations#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/plant_associations").to route_to("plant_associations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/plant_associations/1").to route_to("plant_associations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/plant_associations/1").to route_to("plant_associations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/plant_associations/1").to route_to("plant_associations#destroy", id: "1")
    end
  end
end
