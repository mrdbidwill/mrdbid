require "rails_helper"

RSpec.describe AllGroupsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/all_groups").to route_to("all_groups#index")
    end

    it "routes to #new" do
      expect(get: "/all_groups/new").to route_to("all_groups#new")
    end

    it "routes to #show" do
      expect(get: "/all_groups/1").to route_to("all_groups#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/all_groups/1/edit").to route_to("all_groups#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/all_groups").to route_to("all_groups#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/all_groups/1").to route_to("all_groups#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/all_groups/1").to route_to("all_groups#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/all_groups/1").to route_to("all_groups#destroy", id: "1")
    end
  end
end
