require "rails_helper"

RSpec.describe StemSurfacesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/stem_surfaces").to route_to("stem_surfaces#index")
    end

    it "routes to #new" do
      expect(get: "/stem_surfaces/new").to route_to("stem_surfaces#new")
    end

    it "routes to #show" do
      expect(get: "/stem_surfaces/1").to route_to("stem_surfaces#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/stem_surfaces/1/edit").to route_to("stem_surfaces#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/stem_surfaces").to route_to("stem_surfaces#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/stem_surfaces/1").to route_to("stem_surfaces#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/stem_surfaces/1").to route_to("stem_surfaces#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/stem_surfaces/1").to route_to("stem_surfaces#destroy", id: "1")
    end
  end
end
