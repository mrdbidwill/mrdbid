require "rails_helper"

RSpec.describe LensController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/lens").to route_to("lens#index")
    end

    it "routes to #new" do
      expect(get: "/lens/new").to route_to("lens#new")
    end

    it "routes to #show" do
      expect(get: "/lens/1").to route_to("lens#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/lens/1/edit").to route_to("lens#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/lens").to route_to("lens#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/lens/1").to route_to("lens#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/lens/1").to route_to("lens#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/lens/1").to route_to("lens#destroy", id: "1")
    end
  end
end
