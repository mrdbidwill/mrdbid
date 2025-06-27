require "rails_helper"

RSpec.describe RhizomorphTexturesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/rhizomorph_textures").to route_to("rhizomorph_textures#index")
    end

    it "routes to #new" do
      expect(get: "/rhizomorph_textures/new").to route_to("rhizomorph_textures#new")
    end

    it "routes to #show" do
      expect(get: "/rhizomorph_textures/1").to route_to("rhizomorph_textures#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/rhizomorph_textures/1/edit").to route_to("rhizomorph_textures#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/rhizomorph_textures").to route_to("rhizomorph_textures#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/rhizomorph_textures/1").to route_to("rhizomorph_textures#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/rhizomorph_textures/1").to route_to("rhizomorph_textures#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/rhizomorph_textures/1").to route_to("rhizomorph_textures#destroy", id: "1")
    end
  end
end
