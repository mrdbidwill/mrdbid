require "rails_helper"

RSpec.describe ImageMushroomsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/image_mushrooms").to route_to("image_mushrooms#index")
    end

    it "routes to #new" do
      expect(get: "/image_mushrooms/new").to route_to("image_mushrooms#new")
    end

    it "routes to #show" do
      expect(get: "/image_mushrooms/1").to route_to("image_mushrooms#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/image_mushrooms/1/edit").to route_to("image_mushrooms#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/image_mushrooms").to route_to("image_mushrooms#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/image_mushrooms/1").to route_to("image_mushrooms#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/image_mushrooms/1").to route_to("image_mushrooms#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/image_mushrooms/1").to route_to("image_mushrooms#destroy", id: "1")
    end
  end
end
