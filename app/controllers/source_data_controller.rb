# frozen_string_literal: true

class SourceDataController < ApplicationController
  before_action :set_source_datum, only: %i[show edit update destroy]

  # GET /source_data or /source_data.json
  def index
    @source_data = SourceDatum.all
  end

  # GET /source_data/1 or /source_data/1.json
  def show; end

  # GET /source_data/new
  def new
    @source_datum = SourceDatum.new
  end

  # GET /source_data/1/edit
  def edit; end

  # POST /source_data or /source_data.json
  def create
    @source_datum = SourceDatum.new(source_datum_params)

    respond_to do |format|
      if @source_datum.save
        format.html { redirect_to @source_datum, notice: 'Source datum was successfully created.' }
        format.json { render :show, status: :created, location: @source_datum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @source_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /source_data/1 or /source_data/1.json
  def update
    respond_to do |format|
      if @source_datum.update(source_datum_params)
        format.html { redirect_to @source_datum, notice: 'Source datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @source_datum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @source_datum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_data/1 or /source_data/1.json
  def destroy
    @source_datum.destroy!

    respond_to do |format|
      format.html do
        redirect_to source_data_path, status: :see_other, notice: 'Source datum was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_source_datum
    @source_datum = SourceDatum.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def source_datum_params
    params.expect(source_datum: %i[title author ref item_code source_data_type comment])
  end
end
