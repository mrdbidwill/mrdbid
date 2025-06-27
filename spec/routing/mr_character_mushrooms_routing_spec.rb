require "rails_helper"

RSpec.describe MrCharacterMushroomsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/mr_character_mushrooms").to route_to("mr_character_mushrooms#index")
    end

    it "routes to #new" do
      expect(get: "/mr_character_mushrooms/new").to route_to("mr_character_mushrooms#new")
    end

    it "routes to #show" do
      expect(get: "/mr_character_mushrooms/1").to route_to("mr_character_mushrooms#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/mr_character_mushrooms/1/edit").to route_to("mr_character_mushrooms#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/mr_character_mushrooms").to route_to("mr_character_mushrooms#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/mr_character_mushrooms/1").to route_to("mr_character_mushrooms#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/mr_character_mushrooms/1").to route_to("mr_character_mushrooms#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/mr_character_mushrooms/1").to route_to("mr_character_mushrooms#destroy", id: "1")
    end
  end
end
