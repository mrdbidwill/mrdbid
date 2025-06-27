require "rails_helper"

RSpec.describe GillBreadthsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/gill_breadths").to route_to("gill_breadths#index")
    end

    it "routes to #new" do
      expect(get: "/gill_breadths/new").to route_to("gill_breadths#new")
    end

    it "routes to #show" do
      expect(get: "/gill_breadths/1").to route_to("gill_breadths#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/gill_breadths/1/edit").to route_to("gill_breadths#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/gill_breadths").to route_to("gill_breadths#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/gill_breadths/1").to route_to("gill_breadths#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/gill_breadths/1").to route_to("gill_breadths#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/gill_breadths/1").to route_to("gill_breadths#destroy", id: "1")
    end
  end
end
