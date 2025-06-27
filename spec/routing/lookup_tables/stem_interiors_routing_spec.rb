require "rails_helper"

RSpec.describe StemInteriorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/stem_interiors").to route_to("stem_interiors#index")
    end

    it "routes to #new" do
      expect(get: "/stem_interiors/new").to route_to("stem_interiors#new")
    end

    it "routes to #show" do
      expect(get: "/stem_interiors/1").to route_to("stem_interiors#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/stem_interiors/1/edit").to route_to("stem_interiors#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/stem_interiors").to route_to("stem_interiors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/stem_interiors/1").to route_to("stem_interiors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/stem_interiors/1").to route_to("stem_interiors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/stem_interiors/1").to route_to("stem_interiors#destroy", id: "1")
    end
  end
end
