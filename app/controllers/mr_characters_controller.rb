# Public read-only catalog of mushroom character definitions.
# No authentication required. No modifications are allowed here.
class MrCharactersController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_policy_scoped, only: [:index], raise: false

  def index
    @mr_characters = MrCharacter
                       .includes(:part, :observation_method, :fungus_type, :display_option)
                       .order(:name)

    if params[:q].present?
      term = ActiveRecord::Base.sanitize_sql_like(params[:q].to_s.strip)
      @mr_characters = @mr_characters.where("mr_characters.name LIKE ?", "%#{term}%")
    end

    @mr_characters = @mr_characters.where(part_id: params[:part_id]) if params[:part_id].present?
    @mr_characters = @mr_characters.where(fungus_type_id: params[:fungus_type_id]) if params[:fungus_type_id].present?

    @mr_characters = @mr_characters.page(params[:page]).per(50)

    @parts = Part.order(:name).pluck(:name, :id)
    @fungus_types = FungusType.order(:name).pluck(:name, :id)
  end
end
