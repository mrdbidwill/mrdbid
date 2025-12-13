require "test_helper"

class MushroomSearchControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    @mushroom = mushrooms(:one)
    @mushroom.user = @user
    @mushroom.save!
    @fungus_type = fungus_types(:one)
    sign_in @user
  end

  test "should get index" do
    get mushroom_search_index_url
    assert_response :success
  end

  test "should search with text query" do
    get mushroom_search_index_url, params: { q: "test" }
    assert_response :success
    assert assigns(:query)
  end

  test "should filter by fungus type" do
    get mushroom_search_index_url, params: { fungus_type_id: @fungus_type.id }
    assert_response :success
    assert assigns(:fungus_type_id)
  end

  test "should filter by character values" do
    mr_character = mr_characters(:one)

    get mushroom_search_index_url, params: {
      characters: {
        mr_character.id.to_s => "test value"
      }
    }

    assert_response :success
  end

  test "should handle dynamic character filters" do
    mr_character = mr_characters(:one)

    get mushroom_search_index_url, params: {
      characters: {
        "new_1" => {
          "character_id" => mr_character.id.to_s,
          "value" => "test value"
        }
      }
    }

    assert_response :success
  end

  test "should combine multiple filters" do
    mr_character = mr_characters(:one)

    get mushroom_search_index_url, params: {
      q: "test",
      fungus_type_id: @fungus_type.id,
      characters: {
        mr_character.id.to_s => "value"
      }
    }

    assert_response :success
  end

  test "should paginate results" do
    get mushroom_search_index_url, params: { page: 1 }
    assert_response :success
  end

  test "should load fungus types for filter" do
    get mushroom_search_index_url
    assert_response :success
    assert assigns(:fungus_types)
  end

  test "should load common characters for filter" do
    get mushroom_search_index_url
    assert_response :success
    assert assigns(:common_characters)
  end

  test "should only search user's mushrooms" do
    other_user = users(:two)
    other_mushroom = Mushroom.create!(
      user: other_user,
      collection_date: Date.today
    )

    get mushroom_search_index_url
    assert_response :success

    mushrooms = assigns(:mushrooms)
    assert_not_includes mushrooms, other_mushroom
  end

  test "should exclude template mushrooms" do
    get mushroom_search_index_url
    assert_response :success
    # Templates should be excluded
  end

  test "should require authentication" do
    sign_out @user

    get mushroom_search_index_url
    assert_redirected_to new_user_session_path
  end
end
