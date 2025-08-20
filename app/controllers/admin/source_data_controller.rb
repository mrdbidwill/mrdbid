# frozen_string_literal: true

class SourceDataController < ApplicationController
  before_action :set_source_data, only: %i[show edit update destroy]

  # GET /source_data or /source_data.json
  def index
    @source_data = SourceData.all
  end

  # GET /source_data/1 or /source_data/1.json
  def show; end

  # GET /source_data/new
  def new
    @source_data = SourceData.new
  end

  # GET /source_data/1/edit
  def edit; end

  # POST /source_data or /source_data.json
  def create
    @source_data = SourceData.new(source_data_params)

    respond_to do |format|
      if @source_data.save
        format.html { redirect_to @source_data, notice: 'Source datum was successfully created.' }
        format.json { render :show, status: :created, location: @source_data }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @source_data.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /source_data/1 or /source_data/1.json
  def update
    respond_to do |format|
      if @source_data.update(source_data_params)
        format.html { redirect_to @source_data, notice: 'Source datum was successfully updated.' }
        format.json { render :show, status: :ok, location: @source_data }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @source_data.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /source_data/1 or /source_data/1.json
  def destroy
    @source_data.destroy!

    respond_to do |format|
      format.html do
        redirect_to source_data_path, status: :see_other, notice: 'Source datum was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_source_data
    @source_data = SourceData.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def source_data_params
    params.expect(source_data: %i[title author ref item_code source_data_type comment])
  end
end
