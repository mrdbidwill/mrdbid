require "rails_helper"

RSpec.describe CapShapeTopViewsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cap_shape_top_views").to route_to("cap_shape_top_views#index")
    end

    it "routes to #new" do
      expect(get: "/cap_shape_top_views/new").to route_to("cap_shape_top_views#new")
    end

    it "routes to #show" do
      expect(get: "/cap_shape_top_views/1").to route_to("cap_shape_top_views#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cap_shape_top_views/1/edit").to route_to("cap_shape_top_views#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cap_shape_top_views").to route_to("cap_shape_top_views#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cap_shape_top_views/1").to route_to("cap_shape_top_views#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cap_shape_top_views/1").to route_to("cap_shape_top_views#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cap_shape_top_views/1").to route_to("cap_shape_top_views#destroy", id: "1")
    end
  end
end
