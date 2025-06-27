require "rails_helper"

RSpec.describe ImageMushroomThumbnailsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/image_mushroom_thumbnails").to route_to("image_mushroom_thumbnails#index")
    end

    it "routes to #new" do
      expect(get: "/image_mushroom_thumbnails/new").to route_to("image_mushroom_thumbnails#new")
    end

    it "routes to #show" do
      expect(get: "/image_mushroom_thumbnails/1").to route_to("image_mushroom_thumbnails#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/image_mushroom_thumbnails/1/edit").to route_to("image_mushroom_thumbnails#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/image_mushroom_thumbnails").to route_to("image_mushroom_thumbnails#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/image_mushroom_thumbnails/1").to route_to("image_mushroom_thumbnails#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/image_mushroom_thumbnails/1").to route_to("image_mushroom_thumbnails#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/image_mushroom_thumbnails/1").to route_to("image_mushroom_thumbnails#destroy", id: "1")
    end
  end
end
