require "rails_helper"

RSpec.describe StemTexturesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/stem_textures").to route_to("stem_textures#index")
    end

    it "routes to #new" do
      expect(get: "/stem_textures/new").to route_to("stem_textures#new")
    end

    it "routes to #show" do
      expect(get: "/stem_textures/1").to route_to("stem_textures#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/stem_textures/1/edit").to route_to("stem_textures#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/stem_textures").to route_to("stem_textures#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/stem_textures/1").to route_to("stem_textures#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/stem_textures/1").to route_to("stem_textures#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/stem_textures/1").to route_to("stem_textures#destroy", id: "1")
    end
  end
end
