class MrCharactersController < ApplicationController
  def index
    @mr_characters = MrCharacter.includes(:display_option, :part, :source).all
  end

  def show
    @mr_character = MrCharacter.find(params[:id])
  end

  def edit
    @mr_character = MrCharacter.find(params[:id])
  end
end
