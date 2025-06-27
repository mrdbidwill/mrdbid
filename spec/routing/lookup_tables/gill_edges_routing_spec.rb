require "rails_helper"

RSpec.describe GillEdgesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/gill_edges").to route_to("gill_edges#index")
    end

    it "routes to #new" do
      expect(get: "/gill_edges/new").to route_to("gill_edges#new")
    end

    it "routes to #show" do
      expect(get: "/gill_edges/1").to route_to("gill_edges#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/gill_edges/1/edit").to route_to("gill_edges#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/gill_edges").to route_to("gill_edges#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/gill_edges/1").to route_to("gill_edges#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/gill_edges/1").to route_to("gill_edges#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/gill_edges/1").to route_to("gill_edges#destroy", id: "1")
    end
  end
end
