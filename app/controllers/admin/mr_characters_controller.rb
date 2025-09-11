# app/controllers/admin/mr_characters_controller.rb
class Admin::MrCharactersController < Admin::ApplicationController
  before_action :set_mr_character, only: [:show, :edit, :update, :destroy]

  def index
    authorize MrCharacter
    @mr_characters = policy_scope(
      MrCharacter
        .includes( :part, :lookup_type, :display_option, :source_data)
        .order(:name)
    )
    # Apply filters
    @mr_characters = @mr_characters.where(lookup_type_id: params[:lookup_type_id]) if params[:lookup_type_id].present?
    @mr_characters = @mr_characters.where(part_id: params[:part_id]) if params[:part_id].present?

    # Search by name or ID
    if params[:q].present?
      term_raw = params[:q].to_s.strip
      term = ActiveRecord::Base.sanitize_sql_like(term_raw)
      if term_raw =~ /\A\d+\z/
        @mr_characters = @mr_characters.where("mr_characters.id = ? OR mr_characters.name LIKE ?", term_raw.to_i, "%#{term}%")
      else
        @mr_characters = @mr_characters.where("mr_characters.name LIKE ?", "%#{term}%")
      end
    end

    # Paginate (required for `paginate` helper)
    @mr_characters = @mr_characters.page(params[:page]).per(20)

    # Populate parts dropdown
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

  def new
    authorize MrCharacter
    @mr_character = MrCharacter.new
  end

  def create
    authorize MrCharacter
    @mr_character = MrCharacter.new(mr_character_params)
    if @mr_character.save
      redirect_to admin_mr_characters_path, notice: "Character created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize MrCharacter
  end

  def show
    @mr_character = MrCharacter
                      .includes(:part, :lookup_type, :display_option, :source_data)
                      .find(params.expect(:id))
    authorize @mr_character
  end


  def update
    authorize MrCharacter
    if @mr_character.update(mr_character_params)
      redirect_to admin_mr_characters_path, notice: "Character updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize MrCharacter
    @mr_character.destroy
    redirect_to admin_mr_characters_path, notice: "Character deleted successfully."
  end

  private

  def set_mr_character
    @mr_character = MrCharacter.find(params[:id])
  end

  def mr_character_params
    params.require(:mr_character).permit(:name, :description, :comments, :part_id, :lookup_type_id, :display_option_id, :source_data_id)
  end
end