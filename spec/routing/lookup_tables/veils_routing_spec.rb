require "rails_helper"

RSpec.describe VeilsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/veils").to route_to("veils#index")
    end

    it "routes to #new" do
      expect(get: "/veils/new").to route_to("veils#new")
    end

    it "routes to #show" do
      expect(get: "/veils/1").to route_to("veils#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/veils/1/edit").to route_to("veils#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/veils").to route_to("veils#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/veils/1").to route_to("veils#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/veils/1").to route_to("veils#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/veils/1").to route_to("veils#destroy", id: "1")
    end
  end
end
