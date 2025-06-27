class LensController < ApplicationController
  before_action :set_lens, only: %i[ show edit update destroy ]

  # GET /lens or /lens.json
  def index
    @lens = Lens.all
  end

  # GET /lens/1 or /lens/1.json
  def show
  end

  # GET /lens/new
  def new
    @lens = Lens.new
  end

  # GET /lens/1/edit
  def edit
  end

  # POST /lens or /lens.json
  def create
    @lens = Lens.new(lens_params)

    respond_to do |format|
      if @lens.save
        format.html { redirect_to @lens, notice: "Lens was successfully created." }
        format.json { render :show, status: :created, location: @lens }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @lens.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lens/1 or /lens/1.json
  def update
    respond_to do |format|
      if @lens.update(lens_params)
        format.html { redirect_to @lens, notice: "Lens was successfully updated." }
        format.json { render :show, status: :ok, location: @lens }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @lens.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lens/1 or /lens/1.json
  def destroy
    @lens.destroy!

    respond_to do |format|
      format.html { redirect_to lens_index_path, status: :see_other, notice: "Lens was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lens
      @lens = Lens.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def lens_params
      params.expect(lens: [ :make, :model, :description, :comments ])
    end
end
