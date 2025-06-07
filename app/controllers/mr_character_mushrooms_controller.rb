class MrCharacterMushroomsController < ApplicationController
  before_action :set_mr_character_mushroom, only: %i[ show edit update destroy ]

  # GET /mr_character_mushrooms or /mr_character_mushrooms.json
  def index
    @mr_character_mushrooms = MrCharacterMushroom.all
  end

  # GET /mr_character_mushrooms/1 or /mr_character_mushrooms/1.json
  def show
  end

  # GET /mr_character_mushrooms/new
  def new
    @mr_character_mushroom = MrCharacterMushroom.new
  end

  # GET /mr_character_mushrooms/1/edit
  def edit
  end

  # POST /mr_character_mushrooms or /mr_character_mushrooms.json
  def create
    @mr_character_mushroom = MrCharacterMushroom.new(mr_character_mushroom_params)

    respond_to do |format|
      if @mr_character_mushroom.save
        format.html { redirect_to @mr_character_mushroom, notice: "Mr character mushroom was successfully created." }
        format.json { render :show, status: :created, location: @mr_character_mushroom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mr_character_mushroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mr_character_mushrooms/1 or /mr_character_mushrooms/1.json
  def update
    respond_to do |format|
      if @mr_character_mushroom.update(mr_character_mushroom_params)
        format.html { redirect_to @mr_character_mushroom, notice: "Mr character mushroom was successfully updated." }
        format.json { render :show, status: :ok, location: @mr_character_mushroom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mr_character_mushroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mr_character_mushrooms/1 or /mr_character_mushrooms/1.json
  def destroy
    @mr_character_mushroom.destroy!

    respond_to do |format|
      format.html { redirect_to mr_character_mushrooms_path, status: :see_other, notice: "Mr character mushroom was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mr_character_mushroom
      @mr_character_mushroom = MrCharacterMushroom.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def mr_character_mushroom_params
      params.expect(mr_character_mushroom: [ :mr_character_id_id, :mushroom_id_id, :character_value, :entered_by_id ])
    end
end
