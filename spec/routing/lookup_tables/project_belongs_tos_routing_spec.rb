require "rails_helper"

RSpec.describe ProjectBelongsTosController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/project_belongs_tos").to route_to("project_belongs_tos#index")
    end

    it "routes to #new" do
      expect(get: "/project_belongs_tos/new").to route_to("project_belongs_tos#new")
    end

    it "routes to #show" do
      expect(get: "/project_belongs_tos/1").to route_to("project_belongs_tos#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/project_belongs_tos/1/edit").to route_to("project_belongs_tos#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/project_belongs_tos").to route_to("project_belongs_tos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/project_belongs_tos/1").to route_to("project_belongs_tos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/project_belongs_tos/1").to route_to("project_belongs_tos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/project_belongs_tos/1").to route_to("project_belongs_tos#destroy", id: "1")
    end
  end
end
