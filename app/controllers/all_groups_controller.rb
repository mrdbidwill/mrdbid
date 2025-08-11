class AllGroupsController < ApplicationController
  include Pundit::Authorization

  # GET /all_groups or /all_groups.json
  def index
    @all_groups = policy_scope(AllGroup)
    respond_to do |format|
      format.html { head :ok }
      format.any  { head :ok }
    end
  end

  # GET /all_groups/1 or /all_groups/1.json
  def show
    @all_group = authorize current_user.all_groups.find(params[:id])
    respond_to do |format|
      format.html { head :ok }
      format.any  { head :ok }
    end
  end


  # GET /all_groups/new
  def new
    @all_group = AllGroup.new
    # Allow access to new action for signed-in users without ownership requirement
    authorize @all_group, :new?
    respond_to do |format|
      format.html { head :ok }
      format.any  { head :ok }
    end
  end

  # GET /all_groups/1/edit
  def edit
    @all_group = authorize current_user.all_groups.find(params[:id])
    respond_to do |format|
      format.html { head :ok }
      format.any  { head :ok }
    end
  end


  # POST /all_groups or /all_groups.json
  def create
    @all_group = current_user.all_groups.build(all_group_params)
    authorize @all_group
    if @all_group.save
      redirect_to all_group_url(@all_group), notice: "Group was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end



  # PATCH/PUT /all_groups/1 or /all_groups/1.json
  def update
    @all_group = authorize current_user.all_groups.find(params[:id])
    if @all_group.update(all_group_params)
      redirect_to @all_group, notice: "Group was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  # DELETE /all_groups/1 or /all_groups/1.json
  def destroy
    @all_group = authorize current_user.all_groups.find(params[:id])
    @all_group.destroy!
    redirect_to all_groups_path, notice: "Group was successfully destroyed."
  end


  private
  # Only allow a list of trusted parameters through.
    def all_group_params
      params.expect(all_group: [ :name, :description, :comments ])
    end
end
