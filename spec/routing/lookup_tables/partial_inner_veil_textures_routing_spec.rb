require "rails_helper"

RSpec.describe PartialInnerVeilTexturesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/partial_inner_veil_textures").to route_to("partial_inner_veil_textures#index")
    end

    it "routes to #new" do
      expect(get: "/partial_inner_veil_textures/new").to route_to("partial_inner_veil_textures#new")
    end

    it "routes to #show" do
      expect(get: "/partial_inner_veil_textures/1").to route_to("partial_inner_veil_textures#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/partial_inner_veil_textures/1/edit").to route_to("partial_inner_veil_textures#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/partial_inner_veil_textures").to route_to("partial_inner_veil_textures#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/partial_inner_veil_textures/1").to route_to("partial_inner_veil_textures#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/partial_inner_veil_textures/1").to route_to("partial_inner_veil_textures#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/partial_inner_veil_textures/1").to route_to("partial_inner_veil_textures#destroy", id: "1")
    end
  end
end
