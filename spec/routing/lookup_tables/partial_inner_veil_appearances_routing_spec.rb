require "rails_helper"

RSpec.describe PartialInnerVeilAppearancesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/partial_inner_veil_appearances").to route_to("partial_inner_veil_appearances#index")
    end

    it "routes to #new" do
      expect(get: "/partial_inner_veil_appearances/new").to route_to("partial_inner_veil_appearances#new")
    end

    it "routes to #show" do
      expect(get: "/partial_inner_veil_appearances/1").to route_to("partial_inner_veil_appearances#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/partial_inner_veil_appearances/1/edit").to route_to("partial_inner_veil_appearances#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/partial_inner_veil_appearances").to route_to("partial_inner_veil_appearances#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/partial_inner_veil_appearances/1").to route_to("partial_inner_veil_appearances#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/partial_inner_veil_appearances/1").to route_to("partial_inner_veil_appearances#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/partial_inner_veil_appearances/1").to route_to("partial_inner_veil_appearances#destroy", id: "1")
    end
  end
end
