class AllGroupMushroomsController < ApplicationController
  before_action :set_all_group_mushroom, only: %i[ show edit update destroy ]

  # GET /all_group_mushrooms or /all_group_mushrooms.json
  def index
    @all_group_mushrooms = AllGroupMushroom.all
  end

  # GET /all_group_mushrooms/1 or /all_group_mushrooms/1.json
  def show
  end

  # GET /all_group_mushrooms/new
  def new
    @all_group_mushroom = AllGroupMushroom.new
  end

  # GET /all_group_mushrooms/1/edit
  def edit
  end

  # POST /all_group_mushrooms or /all_group_mushrooms.json
  def create
    @all_group_mushroom = AllGroupMushroom.new(all_group_mushroom_params)

    respond_to do |format|
      if @all_group_mushroom.save
        format.html { redirect_to @all_group_mushroom, notice: "All group mushroom was successfully created." }
        format.json { render :show, status: :created, location: @all_group_mushroom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @all_group_mushroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /all_group_mushrooms/1 or /all_group_mushrooms/1.json
  def update
    respond_to do |format|
      if @all_group_mushroom.update(all_group_mushroom_params)
        format.html { redirect_to @all_group_mushroom, notice: "All group mushroom was successfully updated." }
        format.json { render :show, status: :ok, location: @all_group_mushroom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @all_group_mushroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /all_group_mushrooms/1 or /all_group_mushrooms/1.json
  def destroy
    @all_group_mushroom.destroy!

    respond_to do |format|
      format.html { redirect_to all_group_mushrooms_path, status: :see_other, notice: "All group mushroom was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_all_group_mushroom
      @all_group_mushroom = AllGroupMushroom.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def all_group_mushroom_params
    params.require(all_group_mushroom: [ :all_group_id_id, :mushroom_id_id ])
    end
end
