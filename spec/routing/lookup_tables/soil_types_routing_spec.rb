require "rails_helper"

RSpec.describe SoilTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/soil_types").to route_to("soil_types#index")
    end

    it "routes to #new" do
      expect(get: "/soil_types/new").to route_to("soil_types#new")
    end

    it "routes to #show" do
      expect(get: "/soil_types/1").to route_to("soil_types#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/soil_types/1/edit").to route_to("soil_types#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/soil_types").to route_to("soil_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/soil_types/1").to route_to("soil_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/soil_types/1").to route_to("soil_types#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/soil_types/1").to route_to("soil_types#destroy", id: "1")
    end
  end
end
