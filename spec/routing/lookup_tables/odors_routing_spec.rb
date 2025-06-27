require "rails_helper"

RSpec.describe OdorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/odors").to route_to("odors#index")
    end

    it "routes to #new" do
      expect(get: "/odors/new").to route_to("odors#new")
    end

    it "routes to #show" do
      expect(get: "/odors/1").to route_to("odors#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/odors/1/edit").to route_to("odors#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/odors").to route_to("odors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/odors/1").to route_to("odors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/odors/1").to route_to("odors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/odors/1").to route_to("odors#destroy", id: "1")
    end
  end
end
