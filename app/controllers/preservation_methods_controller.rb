class PreservationMethodsController < ApplicationController
  before_action :set_preservation_method, only: %i[ show edit update destroy ]

  # GET /preservation_methods or /preservation_methods.json
  def index
    @preservation_methods = PreservationMethod.all
  end

  # GET /preservation_methods/1 or /preservation_methods/1.json
  def show
  end

  # GET /preservation_methods/new
  def new
    @preservation_method = PreservationMethod.new
  end

  # GET /preservation_methods/1/edit
  def edit
  end

  # POST /preservation_methods or /preservation_methods.json
  def create
    @preservation_method = PreservationMethod.new(preservation_method_params)

    respond_to do |format|
      if @preservation_method.save
        format.html { redirect_to @preservation_method, notice: "Preservation method was successfully created." }
        format.json { render :show, status: :created, location: @preservation_method }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @preservation_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /preservation_methods/1 or /preservation_methods/1.json
  def update
    respond_to do |format|
      if @preservation_method.update(preservation_method_params)
        format.html { redirect_to @preservation_method, notice: "Preservation method was successfully updated." }
        format.json { render :show, status: :ok, location: @preservation_method }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @preservation_method.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /preservation_methods/1 or /preservation_methods/1.json
  def destroy
    @preservation_method.destroy!

    respond_to do |format|
      format.html { redirect_to preservation_methods_path, status: :see_other, notice: "Preservation method was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_preservation_method
      @preservation_method = PreservationMethod.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def preservation_method_params
      params.expect(preservation_method: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
