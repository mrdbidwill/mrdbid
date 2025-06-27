require "rails_helper"

RSpec.describe MushroomStorageLocationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/mushroom_storage_locations").to route_to("mushroom_storage_locations#index")
    end

    it "routes to #new" do
      expect(get: "/mushroom_storage_locations/new").to route_to("mushroom_storage_locations#new")
    end

    it "routes to #show" do
      expect(get: "/mushroom_storage_locations/1").to route_to("mushroom_storage_locations#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/mushroom_storage_locations/1/edit").to route_to("mushroom_storage_locations#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/mushroom_storage_locations").to route_to("mushroom_storage_locations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/mushroom_storage_locations/1").to route_to("mushroom_storage_locations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/mushroom_storage_locations/1").to route_to("mushroom_storage_locations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/mushroom_storage_locations/1").to route_to("mushroom_storage_locations#destroy", id: "1")
    end
  end
end
