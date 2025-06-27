require "rails_helper"

RSpec.describe CapMarginTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/cap_margin_types").to route_to("cap_margin_types#index")
    end

    it "routes to #new" do
      expect(get: "/cap_margin_types/new").to route_to("cap_margin_types#new")
    end

    it "routes to #show" do
      expect(get: "/cap_margin_types/1").to route_to("cap_margin_types#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/cap_margin_types/1/edit").to route_to("cap_margin_types#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/cap_margin_types").to route_to("cap_margin_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/cap_margin_types/1").to route_to("cap_margin_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/cap_margin_types/1").to route_to("cap_margin_types#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/cap_margin_types/1").to route_to("cap_margin_types#destroy", id: "1")
    end
  end
end
