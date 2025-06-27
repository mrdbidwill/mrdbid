require "rails_helper"

RSpec.describe HabitatsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/habitats").to route_to("habitats#index")
    end

    it "routes to #new" do
      expect(get: "/habitats/new").to route_to("habitats#new")
    end

    it "routes to #show" do
      expect(get: "/habitats/1").to route_to("habitats#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/habitats/1/edit").to route_to("habitats#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/habitats").to route_to("habitats#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/habitats/1").to route_to("habitats#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/habitats/1").to route_to("habitats#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/habitats/1").to route_to("habitats#destroy", id: "1")
    end
  end
end
