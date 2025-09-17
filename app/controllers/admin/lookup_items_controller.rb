# app/controllers/admin/lookup_items_controller.rb
class Admin::LookupItemsController < Admin::ApplicationController
  before_action :set_lookup_item, only: [:edit, :update, :destroy]

  def index
    authorize LookupItem
    # @lookup_items = LookupItem.includes(:lookup_type, :source_data).order(:mr_character_id, :name)
    @lookup_items = policy_scope(
      LookupItem.includes(:mr_character).order("mr_character_id, name")
    ).page(params[:page]).per(20)
  end

  def new
    authorize LookupItem
    @lookup_item = LookupItem.new
  end

  def show
    authorize LookupItem
    @lookup_item = LookupItem.find(params[:id])
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

  def edit;
    authorize @lookup_item;
  end

  def update
    authorize @lookup_item
    if @lookup_item.update(lookup_item_params)
      redirect_to admin_lookup_items_path, notice: "Lookup item updated successfully."
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
