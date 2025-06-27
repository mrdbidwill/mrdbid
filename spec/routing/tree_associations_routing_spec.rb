require "rails_helper"

RSpec.describe TreeAssociationsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/tree_associations").to route_to("tree_associations#index")
    end

    it "routes to #new" do
      expect(get: "/tree_associations/new").to route_to("tree_associations#new")
    end

    it "routes to #show" do
      expect(get: "/tree_associations/1").to route_to("tree_associations#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/tree_associations/1/edit").to route_to("tree_associations#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/tree_associations").to route_to("tree_associations#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/tree_associations/1").to route_to("tree_associations#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/tree_associations/1").to route_to("tree_associations#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/tree_associations/1").to route_to("tree_associations#destroy", id: "1")
    end
  end
end
