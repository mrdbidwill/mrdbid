class OdorsController < ApplicationController
  before_action :set_odor, only: %i[ show edit update destroy ]

  # GET /odors or /odors.json
  def index
    @odors = Odor.all
  end

  # GET /odors/1 or /odors/1.json
  def show
  end

  # GET /odors/new
  def new
    @odor = Odor.new
  end

  # GET /odors/1/edit
  def edit
  end

  # POST /odors or /odors.json
  def create
    @odor = Odor.new(odor_params)

    respond_to do |format|
      if @odor.save
        format.html { redirect_to @odor, notice: "Odor was successfully created." }
        format.json { render :show, status: :created, location: @odor }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @odor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /odors/1 or /odors/1.json
  def update
    respond_to do |format|
      if @odor.update(odor_params)
        format.html { redirect_to @odor, notice: "Odor was successfully updated." }
        format.json { render :show, status: :ok, location: @odor }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @odor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /odors/1 or /odors/1.json
  def destroy
    @odor.destroy!

    respond_to do |format|
      format.html { redirect_to odors_path, status: :see_other, notice: "Odor was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_odor
      @odor = Odor.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def odor_params
    params.require(odor: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
