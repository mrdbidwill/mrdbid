class CameraMakesController < ApplicationController
  before_action :set_camera_make, only: %i[ show edit update destroy ]

  # GET /camera_makes or /camera_makes.json
  def index
    @camera_makes = CameraMake.all
  end

  # GET /camera_makes/1 or /camera_makes/1.json
  def show
  end

  # GET /camera_makes/new
  def new
    @camera_make = CameraMake.new
  end

  # GET /camera_makes/1/edit
  def edit
  end

  # POST /camera_makes or /camera_makes.json
  def create
    @camera_make = CameraMake.new(camera_make_params)

    respond_to do |format|
      if @camera_make.save
        format.html { redirect_to @camera_make, notice: "Camera make was successfully created." }
        format.json { render :show, status: :created, location: @camera_make }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @camera_make.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camera_makes/1 or /camera_makes/1.json
  def update
    respond_to do |format|
      if @camera_make.update(camera_make_params)
        format.html { redirect_to @camera_make, notice: "Camera make was successfully updated." }
        format.json { render :show, status: :ok, location: @camera_make }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @camera_make.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camera_makes/1 or /camera_makes/1.json
  def destroy
    @camera_make.destroy!

    respond_to do |format|
      format.html { redirect_to camera_makes_path, status: :see_other, notice: "Camera make was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camera_make
      @camera_make = CameraMake.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def camera_make_params
      params.expect(camera_make: [ :name, :description, :comments, :source_id ])
    end
end
