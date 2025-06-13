class DisplayOptionsController < ApplicationController
  before_action :set_display_option, only: %i[ show edit update destroy ]

  # GET /display_options or /display_options.json
  def index
    @display_options = DisplayOption.all
  end

  # GET /display_options/1 or /display_options/1.json
  def show
  end

  # GET /display_options/new
  def new
    @display_option = DisplayOption.new
  end

  # GET /display_options/1/edit
  def edit
  end

  # POST /display_options or /display_options.json
  def create
    @display_option = DisplayOption.new(display_option_params)

    respond_to do |format|
      if @display_option.save
        format.html { redirect_to @display_option, notice: "Display option was successfully created." }
        format.json { render :show, status: :created, location: @display_option }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @display_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /display_options/1 or /display_options/1.json
  def update
    respond_to do |format|
      if @display_option.update(display_option_params)
        format.html { redirect_to @display_option, notice: "Display option was successfully updated." }
        format.json { render :show, status: :ok, location: @display_option }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @display_option.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /display_options/1 or /display_options/1.json
  def destroy
    @display_option.destroy!

    respond_to do |format|
      format.html { redirect_to display_options_path, status: :see_other, notice: "Display option was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_display_option
      @display_option = DisplayOption.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def display_option_params
    params.require(display_option: [ :name, :description, :comments, :source_id, :entered_by_id ])
    end
end
