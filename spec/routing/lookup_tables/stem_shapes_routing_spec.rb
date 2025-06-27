require "rails_helper"

RSpec.describe StemShapesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/stem_shapes").to route_to("stem_shapes#index")
    end

    it "routes to #new" do
      expect(get: "/stem_shapes/new").to route_to("stem_shapes#new")
    end

    it "routes to #show" do
      expect(get: "/stem_shapes/1").to route_to("stem_shapes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/stem_shapes/1/edit").to route_to("stem_shapes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/stem_shapes").to route_to("stem_shapes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/stem_shapes/1").to route_to("stem_shapes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/stem_shapes/1").to route_to("stem_shapes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/stem_shapes/1").to route_to("stem_shapes#destroy", id: "1")
    end
  end
end
