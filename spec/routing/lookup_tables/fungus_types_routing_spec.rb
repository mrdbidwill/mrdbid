require "rails_helper"

RSpec.describe FungusTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/fungus_types").to route_to("fungus_types#index")
    end

    it "routes to #new" do
      expect(get: "/fungus_types/new").to route_to("fungus_types#new")
    end

    it "routes to #show" do
      expect(get: "/fungus_types/1").to route_to("fungus_types#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/fungus_types/1/edit").to route_to("fungus_types#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/fungus_types").to route_to("fungus_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/fungus_types/1").to route_to("fungus_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/fungus_types/1").to route_to("fungus_types#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/fungus_types/1").to route_to("fungus_types#destroy", id: "1")
    end
  end
end
