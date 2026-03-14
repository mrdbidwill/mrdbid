require "test_helper"

class UserPdfExportJobTest < ActiveJob::TestCase
  setup do
    @user = users(:one)
    @original_cache = Rails.cache
    Rails.cache = ActiveSupport::Cache::MemoryStore.new
  end

  teardown do
    Rails.cache = @original_cache
  end

  test "marks export failed when no mushrooms exist" do
    user = User.create!(
      email: "no_mushrooms_#{SecureRandom.hex(4)}@example.com",
      password: "password",
      confirmed_at: Time.current,
      permission_id: 9
    )
    export_id = "export-no-mushrooms"
    Rails.cache.write("pdf_export:active:#{user.id}", { export_id: export_id, created_at: Time.current })

    UserPdfExportJob.perform_now(user.id, export_id)

    info = Rails.cache.read("pdf_export:#{export_id}")
    assert_equal "failed", info[:status]
    assert_equal "No mushrooms found to export", info[:error]
    assert_nil Rails.cache.read("pdf_export:active:#{user.id}")
  end

  test "creates pdf and marks export ready" do
    export_id = "export-ready"
    Rails.cache.write("pdf_export:active:#{@user.id}", { export_id: export_id, created_at: Time.current })

    fake_pdf = Class.new do
      def render_file(path)
        File.write(path, "%PDF-1.4 test")
      end
    end.new

    fake_service = Class.new do
      def initialize(pdf)
        @pdf = pdf
      end

      def generate
        @pdf
      end
    end.new(fake_pdf)

    original_new = MushroomPdfService.method(:new)
    MushroomPdfService.define_singleton_method(:new) { |_mushrooms| fake_service }

    begin
      UserPdfExportJob.perform_now(@user.id, export_id)

      info = Rails.cache.read("pdf_export:#{export_id}")
      assert_equal "ready", info[:status]
      assert info[:filename].end_with?(".pdf")

      export_path = Rails.root.join("..", "..", "shared", "public", "tmp", "exports", info[:filename])
      assert File.exist?(export_path)
    ensure
      MushroomPdfService.define_singleton_method(:new) { |*args| original_new.call(*args) } if original_new
      FileUtils.rm_f(export_path) if defined?(export_path) && export_path
    end
  end
end
