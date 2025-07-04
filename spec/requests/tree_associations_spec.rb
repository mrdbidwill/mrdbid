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

RSpec.describe "/tree_associations", type: :request do
  let(:source) { create(:source) }

  # This should return the minimal set of attributes required to create a valid
  # TreeAssociation. As you add validations to TreeAssociation, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      TreeAssociation.create! valid_attributes
      get tree_associations_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      tree_association = TreeAssociation.create! valid_attributes
      get tree_association_url(tree_association)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_tree_association_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      tree_association = TreeAssociation.create! valid_attributes
      get edit_tree_association_url(tree_association)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new TreeAssociation" do
        expect {
          post tree_associations_url, params: {tree_association: valid_attributes}
        }.to change(TreeAssociation, :count).by(1)
      end

      it "redirects to the created tree_association" do
        post tree_associations_url, params: {tree_association: valid_attributes}
        expect(response).to redirect_to(tree_association_url(TreeAssociation.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new TreeAssociation" do
        expect {
          post tree_associations_url, params: {tree_association: invalid_attributes}
        }.to change(TreeAssociation, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post tree_associations_url, params: {tree_association: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested tree_association" do
        tree_association = TreeAssociation.create! valid_attributes
        patch tree_association_url(tree_association), params: {tree_association: new_attributes}
        tree_association.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the tree_association" do
        tree_association = TreeAssociation.create! valid_attributes
        patch tree_association_url(tree_association), params: {tree_association: new_attributes}
        tree_association.reload
        expect(response).to redirect_to(tree_association_url(tree_association))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        tree_association = TreeAssociation.create! valid_attributes
        patch tree_association_url(tree_association), params: {tree_association: invalid_attributes}
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested tree_association" do
      tree_association = TreeAssociation.create! valid_attributes
      expect {
        delete tree_association_url(tree_association)
      }.to change(TreeAssociation, :count).by(-1)
    end

    it "redirects to the tree_associations list" do
      tree_association = TreeAssociation.create! valid_attributes
      delete tree_association_url(tree_association)
      expect(response).to redirect_to(tree_associations_url)
    end
  end
end
