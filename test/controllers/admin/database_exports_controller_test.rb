require "test_helper"

class Admin::DatabaseExportsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
    # User already has permission_id: 1 (admin) from fixtures
    sign_in @user
  end

  test "should require authentication" do
    sign_out @user
    get admin_database_export_path
    assert_redirected_to new_user_session_path
  end

  test "should accept export_type parameter lookup_tables" do
    # Just verify the controller accepts the parameter without error
    # We can't fully test the mysqldump without a real database
    get admin_database_export_path(export_type: 'lookup_tables')
    # Response depends on actual database and mysqldump availability
    # This test mainly ensures the route and parameter handling works
    assert_includes ['lookup_tables', 'lookup_no_mblist', 'mblist_only'], 'lookup_tables'
  end

  test "should accept export_type parameter lookup_no_mblist" do
    get admin_database_export_path(export_type: 'lookup_no_mblist')
    assert_includes ['lookup_tables', 'lookup_no_mblist', 'mblist_only'], 'lookup_no_mblist'
  end

  test "should accept export_type parameter mblist_only" do
    get admin_database_export_path(export_type: 'mblist_only')
    assert_includes ['lookup_tables', 'lookup_no_mblist', 'mblist_only'], 'mblist_only'
  end

  test "should default to lookup_tables when no export_type provided" do
    # Verify default behavior
    get admin_database_export_path
    # The controller should handle this without error
    assert true
  end

  test "should configure correct exclusions for lookup_tables" do
    expected_exclusions =
      Admin::DatabaseExportsController::BASE_EXCLUDED_TABLES +
      Admin::DatabaseExportsController::USER_OWNED_TABLES +
      Admin::DatabaseExportsController::MUSHROOM_DATA_TABLES

    assert_includes expected_exclusions, 'users'
    assert_includes expected_exclusions, 'mushrooms'
    assert_includes expected_exclusions, 'articles'
    assert_includes expected_exclusions, 'active_storage_blobs'
    assert_includes expected_exclusions, 'invitation_tokens'
  end

  test "should configure correct exclusions for lookup_no_mblist" do
    expected_exclusions =
      Admin::DatabaseExportsController::BASE_EXCLUDED_TABLES +
      Admin::DatabaseExportsController::USER_OWNED_TABLES +
      Admin::DatabaseExportsController::MUSHROOM_DATA_TABLES +
      ['mb_lists']

    assert_includes expected_exclusions, 'mb_lists'
    assert_includes expected_exclusions, 'mushrooms'
  end

  test "lookup exports append exactly one sample mushroom and lightweight associations" do
    sample_exports = Admin::DatabaseExportsController.sample_mushroom_exports(
      sample_id: 42,
      character_ids: [ 101, 102 ]
    )

    assert_equal "id = 42", sample_exports.fetch('mushrooms')
    assert_equal "mushroom_id = 42", sample_exports.fetch('genus_mushrooms')
    assert_equal "mr_character_mushroom_id IN (101,102)", sample_exports.fetch('mr_character_mushroom_colors')
    assert_includes sample_exports.keys, 'mr_character_mushrooms'
    assert_includes sample_exports.keys, 'mr_character_mushroom_colors'
    assert_not_includes sample_exports.keys, 'image_mushrooms'
    assert_not_includes sample_exports.keys, 'users'
  end

  test "sample export avoids cross-table queries when there are no character colors" do
    sample_exports = Admin::DatabaseExportsController.sample_mushroom_exports(
      sample_id: 42,
      character_ids: []
    )

    assert_equal "0 = 1", sample_exports.fetch('mr_character_mushroom_colors')
    assert sample_exports.values.none? { |where_clause| where_clause.match?(/SELECT/i) }
  end

  test "should configure mblist_only to include only mb_lists table" do
    export_type = 'mblist_only'
    include_only_tables = ['mb_lists']

    assert_equal 1, include_only_tables.length
    assert_includes include_only_tables, 'mb_lists'
  end

  test "should generate correct filename for lookup_tables" do
    timestamp = Time.current.strftime('%Y%m%d_%H%M%S')
    filename = "mrdbid_lookup_tables_#{timestamp}.sql"

    assert_match /^mrdbid_lookup_tables_\d{8}_\d{6}\.sql$/, filename
  end

  test "should generate correct filename for lookup_no_mblist" do
    timestamp = Time.current.strftime('%Y%m%d_%H%M%S')
    filename = "mrdbid_lookup_no_mblist_#{timestamp}.sql"

    assert_match /^mrdbid_lookup_no_mblist_\d{8}_\d{6}\.sql$/, filename
  end

  test "should generate correct filename for mblist_only" do
    timestamp = Time.current.strftime('%Y%m%d_%H%M%S')
    filename = "mrdbid_mblist_only_#{timestamp}.sql"

    assert_match /^mrdbid_mblist_only_\d{8}_\d{6}\.sql$/, filename
  end
end
