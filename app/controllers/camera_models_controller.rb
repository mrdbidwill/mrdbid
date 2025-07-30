class CameraModelsController < ApplicationController
  before_action :set_camera_model, only: %i[ show edit update destroy ]

  # GET /camera_models or /camera_models.json
  def index
    @camera_models = CameraModel.all
  end

  # GET /camera_models/1 or /camera_models/1.json
  def show
  end

  # GET /camera_models/new
  def new
    @camera_model = CameraModel.new
  end

  # GET /camera_models/1/edit
  def edit
  end

  # POST /camera_models or /camera_models.json
  def create
    @camera_model = CameraModel.new(camera_model_params)

    respond_to do |format|
      if @camera_model.save
        format.html { redirect_to @camera_model, notice: "Camera model was successfully created." }
        format.json { render :show, status: :created, location: @camera_model }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @camera_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /camera_models/1 or /camera_models/1.json
  def update
    respond_to do |format|
      if @camera_model.update(camera_model_params)
        format.html { redirect_to @camera_model, notice: "Camera model was successfully updated." }
        format.json { render :show, status: :ok, location: @camera_model }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @camera_model.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /camera_models/1 or /camera_models/1.json
  def destroy
    @camera_model.destroy!

    respond_to do |format|
      format.html { redirect_to camera_models_path, status: :see_other, notice: "Camera model was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_camera_model
      @camera_model = CameraModel.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def camera_model_params
      params.fetch(:camera_model, {})
    end
end
