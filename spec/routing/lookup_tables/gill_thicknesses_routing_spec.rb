require "rails_helper"

RSpec.describe GillThicknessesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/gill_thicknesses").to route_to("gill_thicknesses#index")
    end

    it "routes to #new" do
      expect(get: "/gill_thicknesses/new").to route_to("gill_thicknesses#new")
    end

    it "routes to #show" do
      expect(get: "/gill_thicknesses/1").to route_to("gill_thicknesses#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/gill_thicknesses/1/edit").to route_to("gill_thicknesses#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/gill_thicknesses").to route_to("gill_thicknesses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/gill_thicknesses/1").to route_to("gill_thicknesses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/gill_thicknesses/1").to route_to("gill_thicknesses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/gill_thicknesses/1").to route_to("gill_thicknesses#destroy", id: "1")
    end
  end
end
