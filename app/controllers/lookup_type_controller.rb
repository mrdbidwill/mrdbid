class LookupTypeController < ApplicationController
  before_action :set_lookup_type, only: %i[ show edit update destroy ]
  def index
    @lookup_options = LookupItem.available_for_mushroom_creation
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end