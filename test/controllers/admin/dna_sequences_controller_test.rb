require "test_helper"

class Admin::DnaSequencesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_user = users(:one)
    @admin_user.permission_id = 2
    sign_in @admin_user

    # Create a test DNA sequence
    @dna_sequence = DnaSequence.create!(
      name: "Test Sequence",
      description: "Test description"
    )
  end

  test "should get index" do
    get admin_dna_sequences_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_dna_sequence_url
    assert_response :success
  end

  test "should create dna_sequence" do
    assert_difference("DnaSequence.count") do
      post admin_dna_sequences_url, params: {
        camera_make: {
          name: "New Sequence",
          description: "New description"
        }
      }
    end

    assert_redirected_to admin_camera_make_url(DnaSequence.last)
  end

  test "should show dna_sequence" do
    get admin_dna_sequence_url(@dna_sequence)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_dna_sequence_url(@dna_sequence)
    assert_response :success
  end

  test "should update dna_sequence" do
    patch admin_dna_sequence_url(@dna_sequence), params: {
      camera_make: {
        name: "Updated Sequence"
      }
    }

    assert_redirected_to admin_camera_make_url(@dna_sequence)
  end

  test "should destroy dna_sequence" do
    assert_difference("DnaSequence.count", -1) do
      delete admin_dna_sequence_url(@dna_sequence)
    end

    assert_redirected_to admin_dna_sequences_url
  end
end
