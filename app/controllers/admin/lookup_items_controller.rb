# app/controllers/admin/lookup_items_controller.rb
class Admin::LookupItemsController < Admin::ApplicationController
  before_action :set_lookup_item, only: [:edit, :update, :destroy]

  def index
    authorize LookupItem
    @lookup_items = policy_scope(
      LookupItem.includes(:mr_character, :source_data)
        .joins(:mr_character)
        .order("mr_characters.name, lookup_items.name")  # Sort by character name, then item name
    )

    # Apply character filter if present
    @lookup_items = @lookup_items.where(mr_character_id: params[:mr_character_id]) if params[:mr_character_id].present?

    # Populate mr_characters dropdown - only those that have lookup_items
    @mr_characters = MrCharacter
                      .joins(:lookup_items)
                      .distinct
                      .order(:name)
                      .pluck(:name, :id)
  end

  def new
    authorize LookupItem
    @lookup_item = LookupItem.new
    @mr_characters = MrCharacter.strict_loading(false).includes(:part).order(:name).to_a
  end

  def show
    authorize LookupItem
    @lookup_item = LookupItem.includes(:mr_character, :source_data).find(params[:id])
  end


  def create
    authorize LookupItem
    @lookup_item = LookupItem.new(lookup_item_params)
    if @lookup_item.save
      redirect_to admin_lookup_items_path, notice: "Lookup item created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @lookup_item
    @mr_characters = MrCharacter.strict_loading(false).includes(:part).order(:name).to_a
  end

  def update
    authorize @lookup_item
    if @lookup_item.update(lookup_item_params)
      # Return to filtered view if mr_character_id is present
      redirect_to admin_lookup_items_path(mr_character_id: params[:mr_character_id]),
                  notice: "Lookup item updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @lookup_item
    @lookup_item.destroy
    redirect_to admin_lookup_items_path, notice: "Lookup item deleted successfully."
  end

  def versions
    @lookup_item = LookupItem.find(params[:id])
    # Show most recent first
    @versions = @lookup_item.versions.order(created_at: :desc)
    authorize @lookup_item # Pundit: restricts to admins
  end

  private

  def set_lookup_item
    @lookup_item = LookupItem.find(params[:id])
  end

  def lookup_item_params
    params.require(:lookup_item).permit(:mr_character_id, :name, :description, :comments, :source_data_id)
  end
end
