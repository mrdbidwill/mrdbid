# app/controllers/admin/mr_characters_controller.rb
class Admin::MrCharactersController < Admin::BaseController
  before_action :set_mr_character, only: [:edit, :update, :destroy]

  def index
    @mr_characters = MrCharacter
                       .includes(:source_data, :display_option, :part, :lookup_type)
                       .page(params[:page])        # 👈 This is the key!
                       .per(25)                    # Optional: specify items per page
    @parts = Part.pluck(:name, :id)
  end


  def new
    @mr_character = MrCharacter.new
  end

  def create
    @mr_character = MrCharacter.new(mr_character_params)
    if @mr_character.save
      redirect_to admin_mr_characters_path, notice: "Character created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @mr_character.update(mr_character_params)
      redirect_to admin_mr_characters_path, notice: "Character updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @mr_character.destroy
    redirect_to admin_mr_characters_path, notice: "Character deleted successfully."
  end

  private

  def set_mr_character
    @mr_character = MrCharacter.find(params[:id])
  end

  def mr_character_params
    params.require(:mr_character).permit(:name, :part_id, :lookup_type_id, :display_option_id, :source_data_id)
  end
end