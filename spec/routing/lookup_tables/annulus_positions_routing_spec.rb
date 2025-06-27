require "rails_helper"

RSpec.describe AnnulusPositionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/annulus_positions").to route_to("annulus_positions#index")
    end

    it "routes to #new" do
      expect(get: "/annulus_positions/new").to route_to("annulus_positions#new")
    end

    it "routes to #show" do
      expect(get: "/annulus_positions/1").to route_to("annulus_positions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/annulus_positions/1/edit").to route_to("annulus_positions#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/annulus_positions").to route_to("annulus_positions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/annulus_positions/1").to route_to("annulus_positions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/annulus_positions/1").to route_to("annulus_positions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/annulus_positions/1").to route_to("annulus_positions#destroy", id: "1")
    end
  end
end
