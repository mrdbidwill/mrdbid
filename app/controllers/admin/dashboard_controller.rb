# app/controllers/admin/dashboard_controller.rb
class Admin::DashboardController < Admin::BaseController
  def index
    @mr_character_count = MrCharacter.count
    @lookup_item_count = LookupItem.count
    @source_data_count = SourceData.count
    @last_updated = MrCharacter.order(updated_at: :desc).first
  end
end
