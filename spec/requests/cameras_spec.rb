require 'rails_helper'

RSpec.describe "Cameras Management", type: :request do
  let!(:camera) { create(:camera) }

  describe "GET /index" do
    it "lists all cameras" do
      get cameras_path
      expect(response).to have_http_status(:success)
      expect(response.body).to include(camera.camera_model)
    end
  end

  # Similarly convert tests for `new`, `create`, `show`, `edit`, `update`, and `destroy` actions
end