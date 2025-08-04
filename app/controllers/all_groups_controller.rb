class AllGroupsController < ApplicationController
  before_action :set_all_group, only: %i[ show edit update destroy ]

  # GET /all_groups or /all_groups.json
  def index
    @all_groups = AllGroup.all
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
    @all_group = AllGroup.new(all_group_params)

    respond_to do |format|
      if @all_group.save
        format.html { redirect_to @all_group, notice: "All group was successfully created." }
        format.json { render :show, status: :created, location: @all_group }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @all_group.errors, status: :unprocessable_entity }
      end
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
    def set_all_group
      @all_group = AllGroup.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def all_group_params
      params.expect(all_group: [ :name, :description, :comments ])
    end
end
