class VeilsController < ApplicationController
  before_action :set_veil, only: %i[ show edit update destroy ]

  # GET /veils or /veils.json
  def index
    @veils = Veil.all
  end

  # GET /veils/1 or /veils/1.json
  def show
  end

  # GET /veils/new
  def new
    @veil = Veil.new
  end

  # GET /veils/1/edit
  def edit
  end

  # POST /veils or /veils.json
  def create
    @veil = Veil.new(veil_params)

    respond_to do |format|
      if @veil.save
        format.html { redirect_to @veil, notice: "Veil was successfully created." }
        format.json { render :show, status: :created, location: @veil }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @veil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /veils/1 or /veils/1.json
  def update
    respond_to do |format|
      if @veil.update(veil_params)
        format.html { redirect_to @veil, notice: "Veil was successfully updated." }
        format.json { render :show, status: :ok, location: @veil }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @veil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /veils/1 or /veils/1.json
  def destroy
    @veil.destroy!

    respond_to do |format|
      format.html { redirect_to veils_path, status: :see_other, notice: "Veil was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_veil
      @veil = Veil.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def veil_params
      params.expect(veil: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
