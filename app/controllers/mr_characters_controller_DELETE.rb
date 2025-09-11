# frozen_string_literal: true

# MrCharactersController manages the CRUD operations for MrCharacter records.
# It provides actions to list, view, create, edit, update, and delete instances
# of MrCharacter. Each request triggers appropriate callbacks to ensure data integrity.

class MrCharactersController < ApplicationController
  include Pundit::Authorization

  before_action :set_mr_character, only: %i[show edit update destroy]

  # GET /mr_characters
  def index
    authorize MrCharacter

    scope = policy_scope(
      MrCharacter
        .includes(:part, :lookup_type, :display_option, :source_data)
        .order(:name)
    )

    # Filters
    scope = scope.where(lookup_type_id: params[:lookup_type_id]) if params[:lookup_type_id].present?
    scope = scope.where(part_id: params[:part_id]) if params[:part_id].present?

    # Search by name or ID
    if params[:q].present?
      term_raw = params[:q].to_s.strip
      term = ActiveRecord::Base.sanitize_sql_like(term_raw)
      if term_raw.match?(/\A\d+\z/)
        scope = scope.where("mr_characters.name LIKE ? OR mr_characters.id = ?", "%#{term}%", term_raw.to_i)
      else
        scope = scope.where("mr_characters.name LIKE ?", "%#{term}%")
      end
    end

    # Pagination
    @mr_characters = scope.page(params[:page]).per(20)

    # Parts dropdown (dependent on selected lookup_type)
    @parts =
      if params[:lookup_type_id].present?
        Part.joins(:mr_characters)
            .where(mr_characters: { lookup_type_id: params[:lookup_type_id] })
            .distinct
            .order(:name)
            .pluck(:name, :id)
      else
        Part.order(:name).pluck(:name, :id)
      end
  end



  # GET /mr_characters/1
def show
  @mr_character = MrCharacter
                    .includes(:part, :lookup_type, :display_option, :source_data)
                    .find(params.expect(:id))
  authorize @mr_character
end



  # GET /mr_characters/new
  def new
    @mr_character = MrCharacter.new
  end

  # GET /mr_characters/1/edit
  def edit
    authorize @mr_character
  end

  # POST /mr_characters
  def create
    @mr_character = MrCharacter.new(mr_character_params)

    respond_to do |format|
      if @mr_character.save
        format.html { redirect_to @mr_character, notice: 'Mushroom Character was successfully created.' }
        format.json { render :show, status: :created, location: @mr_character }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mr_character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mr_characters/1
  def update
    authorize @mr_character
  end

  # DELETE /mr_characters/1
  def destroy
    # Temporarily disable strict_loading for this mr_character
    @mr_character.strict_loading!(false) if @mr_character.respond_to?(:strict_loading!)
    @mr_character.destroy
    redirect_to mr_characters_path, notice: "Mushroom Character was successfully destroyed."
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mr_character
    @mr_character = MrCharacter.includes(:part, :source_data).find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to mr_characters_path, alert: "Mushroom Character not found."
  end



  # Only allow a list of trusted parameters through.
  def mr_character_params
    params.require(:mr_character).permit(:name, :part_id, :lookup_type_id, :display_option_id,  :source_data_id)
  end
  end
