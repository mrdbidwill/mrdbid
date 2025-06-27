require "rails_helper"

RSpec.describe AbundancesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/abundances").to route_to("abundances#index")
    end

    it "routes to #new" do
      expect(get: "/abundances/new").to route_to("abundances#new")
    end

    it "routes to #show" do
      expect(get: "/abundances/1").to route_to("abundances#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/abundances/1/edit").to route_to("abundances#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/abundances").to route_to("abundances#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/abundances/1").to route_to("abundances#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/abundances/1").to route_to("abundances#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/abundances/1").to route_to("abundances#destroy", id: "1")
    end
  end
end
