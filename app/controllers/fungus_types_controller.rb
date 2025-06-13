class FungusTypesController < ApplicationController
  before_action :set_fungus_type, only: %i[ show edit update destroy ]

  # GET /fungus_types or /fungus_types.json
  def index
    @fungus_types = FungusType.all
  end

  # GET /fungus_types/1 or /fungus_types/1.json
  def show
  end

  # GET /fungus_types/new
  def new
    @fungus_type = FungusType.new
  end

  # GET /fungus_types/1/edit
  def edit
  end

  # POST /fungus_types or /fungus_types.json
  def create
    @fungus_type = FungusType.new(fungus_type_params)

    respond_to do |format|
      if @fungus_type.save
        format.html { redirect_to @fungus_type, notice: "Fungus type was successfully created." }
        format.json { render :show, status: :created, location: @fungus_type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @fungus_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fungus_types/1 or /fungus_types/1.json
  def update
    respond_to do |format|
      if @fungus_type.update(fungus_type_params)
        format.html { redirect_to @fungus_type, notice: "Fungus type was successfully updated." }
        format.json { render :show, status: :ok, location: @fungus_type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @fungus_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fungus_types/1 or /fungus_types/1.json
  def destroy
    @fungus_type.destroy!

    respond_to do |format|
      format.html { redirect_to fungus_types_path, status: :see_other, notice: "Fungus type was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fungus_type
      @fungus_type = FungusType.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def fungus_type_params
    params.require(fungus_type: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
