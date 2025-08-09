class AllGroupsController < ApplicationController
  include Pundit::Authorization

  before_action :set_and_authorize_all_group, only: %i[ show edit update destroy ]
  before_action :authorize_new_all_group, only: %i[new create]


  # GET /all_groups or /all_groups.json
  def index
    @all_groups = policy_scope(AllGroup)
  end

  # GET /all_groups/1 or /all_groups/1.json
  def show
  end

  # GET /all_groups/new
  def new
    @all_group = AllGroup.new
  end

  # GET /all_groups/1/edit
  def edit
  end

  # POST /all_groups or /all_groups.json
  def create
    @mushroom = current_user.mushrooms.find(params[:mushroom_id])
    @all_group = current_user.all_groups.find(params[:all_group_mushroom][:all_group_id])

    # Authorize at the record/resource level
    authorize @all_group

    @all_group_mushroom = AllGroupMushroom.new(mushroom: @mushroom, all_group: @all_group)

    if @all_group_mushroom.save
      redirect_to mushrooms_path, notice: "Mushroom successfully added to the group."
    else
      render :new, status: :unprocessable_entity
    end
  end


  # PATCH/PUT /all_groups/1 or /all_groups/1.json
  def update
    respond_to do |format|
      if @all_group.update(all_group_params)
        format.html { redirect_to @all_group, notice: "All group was successfully updated." }
        format.json { render :show, status: :ok, location: @all_group }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @all_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /all_groups/1 or /all_groups/1.json
  def destroy
    @all_group.destroy!

    respond_to do |format|
      format.html { redirect_to all_groups_path, status: :see_other, notice: "All group was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
   def set_and_authorize_all_group
     @all_group = authorize current_user.all_groups.find(params[:id])
   end

  def authorize_new_all_group_mushroom
    authorize AllGroupMushroom
  end


  # Only allow a list of trusted parameters through.
    def all_group_params
      params.expect(all_group: [ :name, :description, :comments ])
    end
end
