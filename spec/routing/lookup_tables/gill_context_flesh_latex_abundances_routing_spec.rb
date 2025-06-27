require "rails_helper"

RSpec.describe GillContextFleshLatexAbundancesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/gill_context_flesh_latex_abundances").to route_to("gill_context_flesh_latex_abundances#index")
    end

    it "routes to #new" do
      expect(get: "/gill_context_flesh_latex_abundances/new").to route_to("gill_context_flesh_latex_abundances#new")
    end

    it "routes to #show" do
      expect(get: "/gill_context_flesh_latex_abundances/1").to route_to("gill_context_flesh_latex_abundances#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/gill_context_flesh_latex_abundances/1/edit").to route_to("gill_context_flesh_latex_abundances#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/gill_context_flesh_latex_abundances").to route_to("gill_context_flesh_latex_abundances#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/gill_context_flesh_latex_abundances/1").to route_to("gill_context_flesh_latex_abundances#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/gill_context_flesh_latex_abundances/1").to route_to("gill_context_flesh_latex_abundances#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/gill_context_flesh_latex_abundances/1").to route_to("gill_context_flesh_latex_abundances#destroy", id: "1")
    end
  end
end
