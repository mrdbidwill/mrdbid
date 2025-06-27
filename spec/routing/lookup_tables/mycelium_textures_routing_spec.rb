require "rails_helper"

RSpec.describe MyceliumTexturesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/mycelium_textures").to route_to("mycelium_textures#index")
    end

    it "routes to #new" do
      expect(get: "/mycelium_textures/new").to route_to("mycelium_textures#new")
    end

    it "routes to #show" do
      expect(get: "/mycelium_textures/1").to route_to("mycelium_textures#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/mycelium_textures/1/edit").to route_to("mycelium_textures#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/mycelium_textures").to route_to("mycelium_textures#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/mycelium_textures/1").to route_to("mycelium_textures#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/mycelium_textures/1").to route_to("mycelium_textures#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/mycelium_textures/1").to route_to("mycelium_textures#destroy", id: "1")
    end
  end
end
