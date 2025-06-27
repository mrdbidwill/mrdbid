require "rails_helper"

RSpec.describe DisplayOptionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/display_options").to route_to("display_options#index")
    end

    it "routes to #new" do
      expect(get: "/display_options/new").to route_to("display_options#new")
    end

    it "routes to #show" do
      expect(get: "/display_options/1").to route_to("display_options#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/display_options/1/edit").to route_to("display_options#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/display_options").to route_to("display_options#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/display_options/1").to route_to("display_options#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/display_options/1").to route_to("display_options#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/display_options/1").to route_to("display_options#destroy", id: "1")
    end
  end
end
