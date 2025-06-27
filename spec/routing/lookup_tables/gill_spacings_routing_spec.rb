require "rails_helper"

RSpec.describe GillSpacingsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/gill_spacings").to route_to("gill_spacings#index")
    end

    it "routes to #new" do
      expect(get: "/gill_spacings/new").to route_to("gill_spacings#new")
    end

    it "routes to #show" do
      expect(get: "/gill_spacings/1").to route_to("gill_spacings#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/gill_spacings/1/edit").to route_to("gill_spacings#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/gill_spacings").to route_to("gill_spacings#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/gill_spacings/1").to route_to("gill_spacings#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/gill_spacings/1").to route_to("gill_spacings#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/gill_spacings/1").to route_to("gill_spacings#destroy", id: "1")
    end
  end
end
