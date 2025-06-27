require "rails_helper"

RSpec.describe StemLocationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/stem_locations").to route_to("stem_locations#index")
    end

    it "routes to #new" do
      expect(get: "/stem_locations/new").to route_to("stem_locations#new")
    end

    it "routes to #show" do
      expect(get: "/stem_locations/1").to route_to("stem_locations#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/stem_locations/1/edit").to route_to("stem_locations#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/stem_locations").to route_to("stem_locations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/stem_locations/1").to route_to("stem_locations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/stem_locations/1").to route_to("stem_locations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/stem_locations/1").to route_to("stem_locations#destroy", id: "1")
    end
  end
end
