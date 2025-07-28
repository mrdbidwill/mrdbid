class SourceDataTypeController < ApplicationController
  before_action :set_lookup_type, only: %i[ show edit update destroy ]
  def index
    @source_data_type = SourceDataType.all
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