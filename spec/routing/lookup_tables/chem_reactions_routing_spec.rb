require "rails_helper"

RSpec.describe ChemReactionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/chem_reactions").to route_to("chem_reactions#index")
    end

    it "routes to #new" do
      expect(get: "/chem_reactions/new").to route_to("chem_reactions#new")
    end

    it "routes to #show" do
      expect(get: "/chem_reactions/1").to route_to("chem_reactions#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/chem_reactions/1/edit").to route_to("chem_reactions#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/chem_reactions").to route_to("chem_reactions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/chem_reactions/1").to route_to("chem_reactions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/chem_reactions/1").to route_to("chem_reactions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/chem_reactions/1").to route_to("chem_reactions#destroy", id: "1")
    end
  end
end
