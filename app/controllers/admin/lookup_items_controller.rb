# app/controllers/admin/lookup_items_controller.rb
class Admin::LookupItemsController < Admin::ApplicationController
  before_action :set_lookup_item, only: [:edit, :update, :destroy]

  def index
    # @lookup_items = LookupItem.includes(:lookup_type, :source_data).order(:mr_character_id, :name)
    @lookup_items = policy_scope(LookupItem.includes(:mr_character).order("mr_character_id, name"))
  end

  def new
    @lookup_item = LookupItem.new
  end

  def show
    @lookup_item = LookupItem.find(params[:id])
  end


  def create
    @lookup_item = LookupItem.new(lookup_item_params)
    if @lookup_item.save
      redirect_to admin_lookup_items_path, notice: "Lookup item created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @lookup_item.update(lookup_item_params)
      redirect_to admin_lookup_items_path, notice: "Lookup item updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lookup_item.destroy
    redirect_to admin_lookup_items_path, notice: "Lookup item deleted successfully."
  end

  private

  def set_lookup_item
    @lookup_item = LookupItem.find(params[:id])
  end

  def lookup_item_params
    params.require(:lookup_item).permit(:name, :description, :comments, :mr_character_id, :lookup_type_id, :source_data_id)
  end
end