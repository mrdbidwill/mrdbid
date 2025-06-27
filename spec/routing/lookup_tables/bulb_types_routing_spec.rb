require "rails_helper"

RSpec.describe BulbTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/bulb_types").to route_to("bulb_types#index")
    end

    it "routes to #new" do
      expect(get: "/bulb_types/new").to route_to("bulb_types#new")
    end

    it "routes to #show" do
      expect(get: "/bulb_types/1").to route_to("bulb_types#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/bulb_types/1/edit").to route_to("bulb_types#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/bulb_types").to route_to("bulb_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/bulb_types/1").to route_to("bulb_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/bulb_types/1").to route_to("bulb_types#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/bulb_types/1").to route_to("bulb_types#destroy", id: "1")
    end
  end
end
