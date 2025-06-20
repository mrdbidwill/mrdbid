class LensController < ApplicationController
  before_action :set_len, only: %i[ show edit update destroy ]

  # GET /lens or /lens.json
  def index
    @lens = Len.all
  end

  # GET /lens/1 or /lens/1.json
  def show
  end

  # GET /lens/new
  def new
    @len = Len.new
  end

  # GET /lens/1/edit
  def edit
  end

  # POST /lens or /lens.json
  def create
    @len = Len.new(len_params)

    respond_to do |format|
      if @len.save
        format.html { redirect_to @len, notice: "Len was successfully created." }
        format.json { render :show, status: :created, location: @len }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @len.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lens/1 or /lens/1.json
  def update
    respond_to do |format|
      if @len.update(len_params)
        format.html { redirect_to @len, notice: "Len was successfully updated." }
        format.json { render :show, status: :ok, location: @len }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @len.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lens/1 or /lens/1.json
  def destroy
    @len.destroy!

    respond_to do |format|
      format.html { redirect_to lens_path, status: :see_other, notice: "Len was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_len
      @len = Len.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def len_params
    params.require(len: [ :lens_make_id, :lens_model, :entered_by_id ])
    end
end
