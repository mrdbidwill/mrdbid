require 'rails_helper'

RSpec.describe "Mushrooms Management", type: :request do
  let!(:user) { create(:user) }
  let!(:mushroom) { create(:mushroom, entered_by: user) } # Handles `entered_by` association

  before do
    puts "User for sign_in: #{user.inspect}" # Debugging line
    sign_in user # Logs in the user using Devise
  end

  describe "POST /create" do
    it "creates a new mushroom" do
      mushroom_params = {
        mushroom_name: "Shiitake",
        description: "A popular edible mushroom.",
        date_found: "2025-06-10",
        mushroom_location_id: create(:mushroom_location).id,
        state_id: create(:state).id,
        country_id: create(:country).id,
        fungus_type_id: create(:fungus_type).id,
        entered_by_id: user.id
      }

      expect {
        post mushrooms_path, params: { mushroom: mushroom_params }
      }.to change(Mushroom, :count).by(1)

      expect(response).to redirect_to(mushroom_path(Mushroom.last))
      follow_redirect!
      expect(response.body).to include("Shiitake")
    end
  end

  # Additional specs for GET /index, GET /edit, etc., should be similarly updated.
end