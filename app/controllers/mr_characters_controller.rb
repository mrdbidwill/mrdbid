class MrCharactersController < ApplicationController
  before_action :set_mr_character, only: %i[show edit update destroy]

  def index
    @mr_characters = MrCharacter.includes(:display_option, :part, :source).all
  end

  def show
    # @mr_character is set by the before_action
  end

  def new
    @mr_character = MrCharacter.new
  end

  def edit
    # @mr_character is set by the before_action
  end

  def create
    @mr_character = MrCharacter.new(mr_character_params)

    if @mr_character.save
      redirect_to @mr_character, notice: "MR Character was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    respond_to do |format|
      if @mr_character.update(mr_character_params)
        format.html { redirect_to @mr_character, notice: "Mr character was successfully updated." }
        format.json { render :show, status: :ok, location: @mr_character }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mr_character.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mr_character.destroy!
    respond_to do |format|
      format.html { redirect_to mr_characters_path, status: :see_other, notice: "Mr character was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_mr_character
    @mr_character = MrCharacter.find(params[:id])
  end

  def mr_character_params
    params.require(:mr_character).permit(:name, :display_option_id, :part_id, :source_id)
  end
end
