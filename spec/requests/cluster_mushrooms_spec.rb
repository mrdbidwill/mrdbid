require "rails_helper"

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/cluster_mushrooms", type: :request do
  let(:source) { create(:source) }

  # This should return the minimal set of attributes required to create a valid
  # ClusterMushroom. As you add validations to ClusterMushroom, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      ClusterMushroom.create! valid_attributes
      get cluster_mushrooms_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      cluster_mushroom = ClusterMushroom.create! valid_attributes
      get cluster_mushroom_url(cluster_mushroom)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_cluster_mushroom_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      cluster_mushroom = ClusterMushroom.create! valid_attributes
      get edit_cluster_mushroom_url(cluster_mushroom)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ClusterMushroom" do
        expect {
          post cluster_mushrooms_url, params: {cluster_mushroom: valid_attributes}
        }.to change(ClusterMushroom, :count).by(1)
      end

      it "redirects to the created cluster_mushroom" do
        post cluster_mushrooms_url, params: {cluster_mushroom: valid_attributes}
        expect(response).to redirect_to(cluster_mushroom_url(ClusterMushroom.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ClusterMushroom" do
        expect {
          post cluster_mushrooms_url, params: {cluster_mushroom: invalid_attributes}
        }.to change(ClusterMushroom, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post cluster_mushrooms_url, params: {cluster_mushroom: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested cluster_mushroom" do
        cluster_mushroom = ClusterMushroom.create! valid_attributes
        patch cluster_mushroom_url(cluster_mushroom), params: {cluster_mushroom: new_attributes}
        cluster_mushroom.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the cluster_mushroom" do
        cluster_mushroom = ClusterMushroom.create! valid_attributes
        patch cluster_mushroom_url(cluster_mushroom), params: {cluster_mushroom: new_attributes}
        cluster_mushroom.reload
        expect(response).to redirect_to(cluster_mushroom_url(cluster_mushroom))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        cluster_mushroom = ClusterMushroom.create! valid_attributes
        patch cluster_mushroom_url(cluster_mushroom), params: {cluster_mushroom: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested cluster_mushroom" do
      cluster_mushroom = ClusterMushroom.create! valid_attributes
      expect {
        delete cluster_mushroom_url(cluster_mushroom)
      }.to change(ClusterMushroom, :count).by(-1)
    end

    it "redirects to the cluster_mushrooms list" do
      cluster_mushroom = ClusterMushroom.create! valid_attributes
      delete cluster_mushroom_url(cluster_mushroom)
      expect(response).to redirect_to(cluster_mushrooms_url)
    end
  end
end
