require "rails_helper"

RSpec.describe PartialInnerVeilAnnularRingPositionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/partial_inner_veil_annular_ring_positions").to route_to("partial_inner_veil_annular_ring_positions#index")
    end

    it "routes to #new" do
      expect(get: "/partial_inner_veil_annular_ring_positions/new").to route_to("partial_inner_veil_annular_ring_positions#new")
    end

    it "routes to #show" do
      expect(get: "/partial_inner_veil_annular_ring_positions/1").to route_to("partial_inner_veil_annular_ring_positions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/partial_inner_veil_annular_ring_positions/1/edit").to route_to("partial_inner_veil_annular_ring_positions#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/partial_inner_veil_annular_ring_positions").to route_to("partial_inner_veil_annular_ring_positions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/partial_inner_veil_annular_ring_positions/1").to route_to("partial_inner_veil_annular_ring_positions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/partial_inner_veil_annular_ring_positions/1").to route_to("partial_inner_veil_annular_ring_positions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/partial_inner_veil_annular_ring_positions/1").to route_to("partial_inner_veil_annular_ring_positions#destroy", id: "1")
    end
  end
end
