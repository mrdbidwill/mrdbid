class ColorsController < ApplicationController
  before_action :set_color, only: %i[ show edit update destroy ]

  # GET /colors or /colors.json
  def index
    @colors = Color.by_sequence.page(params[:page])
  end

  # GET /colors/1 or /colors/1.json
  def show
  end

  # GET /colors/new
  def new
    @color = Color.new
  end

  # GET /colors/1/edit
  def edit
  end

  # POST /colors or /colors.json
  def create
    @color = Color.new(color_params)

    respond_to do |format|
      if @color.save
        format.html { redirect_to @color, notice: "Color was successfully created." }
        format.json { render :show, status: :created, location: @color }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /colors/1 or /colors/1.json
  def update
    respond_to do |format|
      if @color.update(color_params)
        format.html { redirect_to @color, notice: "Color was successfully updated." }
        format.json { render :show, status: :ok, location: @color }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @color.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colors/1 or /colors/1.json
  def destroy
    @color.destroy!

    respond_to do |format|
      format.html { redirect_to colors_path, status: :see_other, notice: "Color was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_color
      @color = Color.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
  def color_params
    params.expect(color: [
      :latin_name,
      :common_name,
      :color_group,
      :hex,
      :sequence,
      :r_val,
      :g_val,
      :b_val,
      :cwc_r,
      :cwc_g,
      :cwc_b,
      :closest_websafe_color,
      :image_file_address,
      :metadata
    ])
  end

end
