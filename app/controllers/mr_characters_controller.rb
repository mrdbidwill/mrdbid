# frozen_string_literal: true

class MrCharactersController < ApplicationController
  before_action :set_mr_character, only: %i[show edit update destroy]

  # GET /mr_characters or /mr_characters.json
  def index
    @mr_characters = MrCharacter.all
  end

  # GET /mr_characters/1 or /mr_characters/1.json
  def show; end

  # GET /mr_characters/new
  def new
    @mr_character = MrCharacter.new
  end

  # GET /mr_characters/1/edit
  def edit; end

  # POST /mr_characters or /mr_characters.json
  def create
    @mr_character = MrCharacter.new(mr_character_params)

    respond_to do |format|
      if @mr_character.save
        format.html { redirect_to @mr_character, notice: 'Mr character was successfully created.' }
        format.json { render :show, status: :created, location: @mr_character }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mr_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mr_characters/1 or /mr_characters/1.json
  def update
    respond_to do |format|
      if @mr_character.update(mr_character_params)
        format.html { redirect_to @mr_character, notice: 'Mr character was successfully updated.' }
        format.json { render :show, status: :ok, location: @mr_character }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mr_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mr_characters/1 or /mr_characters/1.json
  def destroy
    @mr_character.destroy!

    respond_to do |format|
      format.html do
        redirect_to mr_characters_path, status: :see_other, notice: 'Mr character was successfully destroyed.'
      end
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mr_character
    @mr_character = MrCharacter.find(params.expect(:id))
  end

  # Only allow a list of trusted parameters through.
  def mr_character_params
    params.expect(mr_character: %i[name display_option_id part_id source_data_id])
  end
end
