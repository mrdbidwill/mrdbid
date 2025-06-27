require "rails_helper"

RSpec.describe MushroomAgesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/mushroom_ages").to route_to("mushroom_ages#index")
    end

    it "routes to #new" do
      expect(get: "/mushroom_ages/new").to route_to("mushroom_ages#new")
    end

    it "routes to #show" do
      expect(get: "/mushroom_ages/1").to route_to("mushroom_ages#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/mushroom_ages/1/edit").to route_to("mushroom_ages#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/mushroom_ages").to route_to("mushroom_ages#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/mushroom_ages/1").to route_to("mushroom_ages#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/mushroom_ages/1").to route_to("mushroom_ages#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/mushroom_ages/1").to route_to("mushroom_ages#destroy", id: "1")
    end
  end
end
