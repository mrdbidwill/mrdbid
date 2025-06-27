require "rails_helper"

RSpec.describe ToxicsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/toxics").to route_to("toxics#index")
    end

    it "routes to #new" do
      expect(get: "/toxics/new").to route_to("toxics#new")
    end

    it "routes to #show" do
      expect(get: "/toxics/1").to route_to("toxics#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/toxics/1/edit").to route_to("toxics#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/toxics").to route_to("toxics#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/toxics/1").to route_to("toxics#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/toxics/1").to route_to("toxics#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/toxics/1").to route_to("toxics#destroy", id: "1")
    end
  end
end
