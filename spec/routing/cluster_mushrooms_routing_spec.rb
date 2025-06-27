require "rails_helper"

RSpec.describe ClusterMushroomsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cluster_mushrooms").to route_to("cluster_mushrooms#index")
    end

    it "routes to #new" do
      expect(get: "/cluster_mushrooms/new").to route_to("cluster_mushrooms#new")
    end

    it "routes to #show" do
      expect(get: "/cluster_mushrooms/1").to route_to("cluster_mushrooms#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cluster_mushrooms/1/edit").to route_to("cluster_mushrooms#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cluster_mushrooms").to route_to("cluster_mushrooms#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cluster_mushrooms/1").to route_to("cluster_mushrooms#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cluster_mushrooms/1").to route_to("cluster_mushrooms#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cluster_mushrooms/1").to route_to("cluster_mushrooms#destroy", id: "1")
    end
  end
end
