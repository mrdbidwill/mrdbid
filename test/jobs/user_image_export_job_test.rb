require "test_helper"

class UserImageExportJobTest < ActiveJob::TestCase
  setup do
    @user = users(:one)
    @mushroom = mushrooms(:one)
    @original_cache = Rails.cache
    Rails.cache = ActiveSupport::Cache::MemoryStore.new
  end

  teardown do
    Rails.cache = @original_cache
  end

  test "marks export failed when no images exist" do
    user = User.create!(
      email: "no_images_#{SecureRandom.hex(4)}@example.com",
      password: "password",
      confirmed_at: Time.current,
      permission_id: 9
    )
    export_id = "export-no-images"
    Rails.cache.write("image_export:active:#{user.id}", { export_id: export_id, created_at: Time.current })

    UserImageExportJob.perform_now(user.id, export_id)

    info = Rails.cache.read("image_export:#{export_id}")
    assert_equal "failed", info[:status]
    assert_equal "No images found to export", info[:error]
    assert_nil Rails.cache.read("image_export:active:#{user.id}")
  end

  test "creates zip and marks export ready" do
    image_mushroom = ImageMushroom.new(
      mushroom: @mushroom,
      part: parts(:one),
      image_name: "Export Test"
    )
    image_mushroom.image_file.attach(
      io: File.open(Rails.root.join("test/fixtures/files/test.jpg")),
      filename: "test.jpg",
      content_type: "image/jpeg"
    )
    image_mushroom.save!

    export_id = "export-ready"
    Rails.cache.write("image_export:active:#{@user.id}", { export_id: export_id, created_at: Time.current })

    UserImageExportJob.perform_now(@user.id, export_id)

    info = Rails.cache.read("image_export:#{export_id}")
    assert_equal "ready", info[:status]
    assert info[:filename].end_with?(".zip")

    export_path = Rails.root.join("..", "..", "shared", "public", "tmp", "exports", info[:filename])
    assert File.exist?(export_path)
  ensure
    FileUtils.rm_f(export_path) if defined?(export_path) && export_path
  end
end
