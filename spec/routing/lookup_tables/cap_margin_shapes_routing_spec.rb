require "rails_helper"

RSpec.describe CapMarginShapesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cap_margin_shapes").to route_to("cap_margin_shapes#index")
    end

    it "routes to #new" do
      expect(get: "/cap_margin_shapes/new").to route_to("cap_margin_shapes#new")
    end

    it "routes to #show" do
      expect(get: "/cap_margin_shapes/1").to route_to("cap_margin_shapes#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cap_margin_shapes/1/edit").to route_to("cap_margin_shapes#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cap_margin_shapes").to route_to("cap_margin_shapes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cap_margin_shapes/1").to route_to("cap_margin_shapes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cap_margin_shapes/1").to route_to("cap_margin_shapes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cap_margin_shapes/1").to route_to("cap_margin_shapes#destroy", id: "1")
    end
  end
end
