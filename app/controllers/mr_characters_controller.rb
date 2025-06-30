class MrCharactersController < ApplicationController
  def index
    @mr_characters = MrCharacter.includes(:display_option, :part, :source).all
  end
end
