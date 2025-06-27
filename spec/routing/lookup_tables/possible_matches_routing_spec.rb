require "rails_helper"

RSpec.describe PossibleMatchesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/possible_matches").to route_to("possible_matches#index")
    end

    it "routes to #new" do
      expect(get: "/possible_matches/new").to route_to("possible_matches#new")
    end

    it "routes to #show" do
      expect(get: "/possible_matches/1").to route_to("possible_matches#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/possible_matches/1/edit").to route_to("possible_matches#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/possible_matches").to route_to("possible_matches#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/possible_matches/1").to route_to("possible_matches#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/possible_matches/1").to route_to("possible_matches#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/possible_matches/1").to route_to("possible_matches#destroy", id: "1")
    end
  end
end
