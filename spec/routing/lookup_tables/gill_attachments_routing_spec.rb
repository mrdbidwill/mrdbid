require "rails_helper"

RSpec.describe GillAttachmentsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/gill_attachments").to route_to("gill_attachments#index")
    end

    it "routes to #new" do
      expect(get: "/gill_attachments/new").to route_to("gill_attachments#new")
    end

    it "routes to #show" do
      expect(get: "/gill_attachments/1").to route_to("gill_attachments#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/gill_attachments/1/edit").to route_to("gill_attachments#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/gill_attachments").to route_to("gill_attachments#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/gill_attachments/1").to route_to("gill_attachments#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/gill_attachments/1").to route_to("gill_attachments#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/gill_attachments/1").to route_to("gill_attachments#destroy", id: "1")
    end
  end
end
