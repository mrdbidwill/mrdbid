class LookupItemsController < ApplicationController
  include Pundit::Authorization

  # GET /lookup_items or /lookup_items.json
  def index
    @lookup_items = policy_scope(LookupItem)
    respond_to do |format|

      format.html
      format.json { render json: @lookup_items }
    end
  end

  # GET /lookup_items/1 or /lookup_items/1.json
  def show
    @lookup_item = authorize current_user.lookup_items.find(params[:id])
    respond_to do |format|

      format.html
      format.json { render json: @lookup_items }
    end
  end


  # GET /lookup_items/new
  def new
    @lookup_item = LookupItem.new
    # Allow access to new action for signed-in users without ownership requirement
    authorize @lookup_item, :new?
    respond_to do |format|

      format.html
      format.json { render json: @lookup_items }
    end
  end

  # GET /lookup_items/1/edit
  def edit
    @lookup_item = authorize current_user.lookup_items.find(params[:id])
    respond_to do |format|

      format.html
      format.json { render json: @lookup_items }
    end
  end


  # POST /lookup_items or /lookup_items.json
  def create
    @lookup_item = current_user.lookup_items.build(lookup_item_params)
    authorize @lookup_item
    if @lookup_item.save
      redirect_to lookup_item_url(@lookup_item), notice: "LookupItem was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /lookup_items/1 or /lookup_items/1.json
  def update
    @lookup_item = authorize current_user.lookup_items.find(params[:id])
    if @lookup_item.update(lookup_item_params)
      redirect_to @lookup_item, notice: "LookupItem was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  # DELETE /lookup_items/1 or /lookup_items/1.json
  def destroy
    @lookup_item = authorize current_user.lookup_items.find(params[:id])
    @lookup_item.destroy!
    redirect_to lookup_items_path, notice: "Lookup Item was successfully destroyed."
  end


  private
  # Only allow a list of trusted parameters through.
  def lookup_item_params
    params.expect(lookup_item: [ :mr_character_id, :name, :description, :comments, :source_data_id ])
  end
end
