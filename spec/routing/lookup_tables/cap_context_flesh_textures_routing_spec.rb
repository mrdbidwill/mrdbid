require "rails_helper"

RSpec.describe CapContextFleshTexturesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cap_context_flesh_textures").to route_to("cap_context_flesh_textures#index")
    end

    it "routes to #new" do
      expect(get: "/cap_context_flesh_textures/new").to route_to("cap_context_flesh_textures#new")
    end

    it "routes to #show" do
      expect(get: "/cap_context_flesh_textures/1").to route_to("cap_context_flesh_textures#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cap_context_flesh_textures/1/edit").to route_to("cap_context_flesh_textures#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cap_context_flesh_textures").to route_to("cap_context_flesh_textures#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cap_context_flesh_textures/1").to route_to("cap_context_flesh_textures#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cap_context_flesh_textures/1").to route_to("cap_context_flesh_textures#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cap_context_flesh_textures/1").to route_to("cap_context_flesh_textures#destroy", id: "1")
    end
  end
end
