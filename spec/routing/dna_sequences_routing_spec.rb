require "rails_helper"

RSpec.describe DnaSequencesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/dna_sequences").to route_to("dna_sequences#index")
    end

    it "routes to #new" do
      expect(get: "/dna_sequences/new").to route_to("dna_sequences#new")
    end

    it "routes to #show" do
      expect(get: "/dna_sequences/1").to route_to("dna_sequences#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/dna_sequences/1/edit").to route_to("dna_sequences#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/dna_sequences").to route_to("dna_sequences#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/dna_sequences/1").to route_to("dna_sequences#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/dna_sequences/1").to route_to("dna_sequences#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/dna_sequences/1").to route_to("dna_sequences#destroy", id: "1")
    end
  end
end
