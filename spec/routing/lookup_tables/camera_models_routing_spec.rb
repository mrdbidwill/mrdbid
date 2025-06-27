require "rails_helper"

RSpec.describe CameraModelsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/camera_models").to route_to("camera_models#index")
    end

    it "routes to #new" do
      expect(get: "/camera_models/new").to route_to("camera_models#new")
    end

    it "routes to #show" do
      expect(get: "/camera_models/1").to route_to("camera_models#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/camera_models/1/edit").to route_to("camera_models#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/camera_models").to route_to("camera_models#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/camera_models/1").to route_to("camera_models#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/camera_models/1").to route_to("camera_models#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/camera_models/1").to route_to("camera_models#destroy", id: "1")
    end
  end
end
