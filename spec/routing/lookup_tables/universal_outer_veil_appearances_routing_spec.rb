require "rails_helper"

RSpec.describe UniversalOuterVeilAppearancesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/universal_outer_veil_appearances").to route_to("universal_outer_veil_appearances#index")
    end

    it "routes to #new" do
      expect(get: "/universal_outer_veil_appearances/new").to route_to("universal_outer_veil_appearances#new")
    end

    it "routes to #show" do
      expect(get: "/universal_outer_veil_appearances/1").to route_to("universal_outer_veil_appearances#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/universal_outer_veil_appearances/1/edit").to route_to("universal_outer_veil_appearances#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/universal_outer_veil_appearances").to route_to("universal_outer_veil_appearances#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/universal_outer_veil_appearances/1").to route_to("universal_outer_veil_appearances#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/universal_outer_veil_appearances/1").to route_to("universal_outer_veil_appearances#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/universal_outer_veil_appearances/1").to route_to("universal_outer_veil_appearances#destroy", id: "1")
    end
  end
end
