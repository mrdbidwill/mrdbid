require "rails_helper"

RSpec.describe PartialInnerVeilFatesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/partial_inner_veil_fates").to route_to("partial_inner_veil_fates#index")
    end

    it "routes to #new" do
      expect(get: "/partial_inner_veil_fates/new").to route_to("partial_inner_veil_fates#new")
    end

    it "routes to #show" do
      expect(get: "/partial_inner_veil_fates/1").to route_to("partial_inner_veil_fates#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/partial_inner_veil_fates/1/edit").to route_to("partial_inner_veil_fates#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/partial_inner_veil_fates").to route_to("partial_inner_veil_fates#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/partial_inner_veil_fates/1").to route_to("partial_inner_veil_fates#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/partial_inner_veil_fates/1").to route_to("partial_inner_veil_fates#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/partial_inner_veil_fates/1").to route_to("partial_inner_veil_fates#destroy", id: "1")
    end
  end
end
