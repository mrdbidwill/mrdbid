require "rails_helper"

RSpec.describe CameraMakesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/camera_makes").to route_to("camera_makes#index")
    end

    it "routes to #new" do
      expect(get: "/camera_makes/new").to route_to("camera_makes#new")
    end

    it "routes to #show" do
      expect(get: "/camera_makes/1").to route_to("camera_makes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/camera_makes/1/edit").to route_to("camera_makes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/camera_makes").to route_to("camera_makes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/camera_makes/1").to route_to("camera_makes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/camera_makes/1").to route_to("camera_makes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/camera_makes/1").to route_to("camera_makes#destroy", id: "1")
    end
  end
end
