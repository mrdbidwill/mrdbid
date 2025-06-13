class TastesController < ApplicationController
  before_action :set_taste, only: %i[ show edit update destroy ]

  # GET /tastes or /tastes.json
  def index
    @tastes = Taste.all
  end

  # GET /tastes/1 or /tastes/1.json
  def show
  end

  # GET /tastes/new
  def new
    @taste = Taste.new
  end

  # GET /tastes/1/edit
  def edit
  end

  # POST /tastes or /tastes.json
  def create
    @taste = Taste.new(taste_params)

    respond_to do |format|
      if @taste.save
        format.html { redirect_to @taste, notice: "Taste was successfully created." }
        format.json { render :show, status: :created, location: @taste }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @taste.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tastes/1 or /tastes/1.json
  def update
    respond_to do |format|
      if @taste.update(taste_params)
        format.html { redirect_to @taste, notice: "Taste was successfully updated." }
        format.json { render :show, status: :ok, location: @taste }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @taste.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tastes/1 or /tastes/1.json
  def destroy
    @taste.destroy!

    respond_to do |format|
      format.html { redirect_to tastes_path, status: :see_other, notice: "Taste was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_taste
      @taste = Taste.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def taste_params
    params.require(taste: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
