require "rails_helper"

RSpec.describe CapSurfaceTexturesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cap_surface_textures").to route_to("cap_surface_textures#index")
    end

    it "routes to #new" do
      expect(get: "/cap_surface_textures/new").to route_to("cap_surface_textures#new")
    end

    it "routes to #show" do
      expect(get: "/cap_surface_textures/1").to route_to("cap_surface_textures#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cap_surface_textures/1/edit").to route_to("cap_surface_textures#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cap_surface_textures").to route_to("cap_surface_textures#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cap_surface_textures/1").to route_to("cap_surface_textures#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cap_surface_textures/1").to route_to("cap_surface_textures#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cap_surface_textures/1").to route_to("cap_surface_textures#destroy", id: "1")
    end
  end
end
