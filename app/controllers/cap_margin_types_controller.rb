class CapMarginTypesController < ApplicationController
  before_action :set_cap_margin_type, only: %i[ show edit update destroy ]

  # GET /cap_margin_types or /cap_margin_types.json
  def index
    @cap_margin_types = CapMarginType.all
  end

  # GET /cap_margin_types/1 or /cap_margin_types/1.json
  def show
  end

  # GET /cap_margin_types/new
  def new
    @cap_margin_type = CapMarginType.new
  end

  # GET /cap_margin_types/1/edit
  def edit
  end

  # POST /cap_margin_types or /cap_margin_types.json
  def create
    @cap_margin_type = CapMarginType.new(cap_margin_type_params)

    respond_to do |format|
      if @cap_margin_type.save
        format.html { redirect_to @cap_margin_type, notice: "Cap margin type was successfully created." }
        format.json { render :show, status: :created, location: @cap_margin_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cap_margin_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cap_margin_types/1 or /cap_margin_types/1.json
  def update
    respond_to do |format|
      if @cap_margin_type.update(cap_margin_type_params)
        format.html { redirect_to @cap_margin_type, notice: "Cap margin type was successfully updated." }
        format.json { render :show, status: :ok, location: @cap_margin_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cap_margin_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cap_margin_types/1 or /cap_margin_types/1.json
  def destroy
    @cap_margin_type.destroy!

    respond_to do |format|
      format.html { redirect_to cap_margin_types_path, status: :see_other, notice: "Cap margin type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cap_margin_type
      @cap_margin_type = CapMarginType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def cap_margin_type_params
      params.expect(cap_margin_type: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
