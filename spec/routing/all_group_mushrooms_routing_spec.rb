require "rails_helper"

RSpec.describe AllGroupMushroomsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/all_group_mushrooms").to route_to("all_group_mushrooms#index")
    end

    it "routes to #new" do
      expect(get: "/all_group_mushrooms/new").to route_to("all_group_mushrooms#new")
    end

    it "routes to #show" do
      expect(get: "/all_group_mushrooms/1").to route_to("all_group_mushrooms#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/all_group_mushrooms/1/edit").to route_to("all_group_mushrooms#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/all_group_mushrooms").to route_to("all_group_mushrooms#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/all_group_mushrooms/1").to route_to("all_group_mushrooms#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/all_group_mushrooms/1").to route_to("all_group_mushrooms#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/all_group_mushrooms/1").to route_to("all_group_mushrooms#destroy", id: "1")
    end
  end
end
