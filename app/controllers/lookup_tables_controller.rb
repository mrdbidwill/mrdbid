# app/controllers/lookup_tables_controller.rb
class LookupTablesController < ApplicationController
  before_action :set_resource, only: %i[show edit update destroy]

  def index
    @resources = resource_class.all
  end

  def show
  end

  def new
    @resource = resource_class.new
  end

  def edit
  end

  def create
    @resource = resource_class.new(resource_params)

    if @resource.save
      redirect_to @resource, notice: "#{resource_class.name} was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @resource.update(resource_params)
      redirect_to @resource, notice: "#{resource_class.name} was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @resource.destroy
    redirect_to action: :index, status: :see_other, notice: "#{resource_class.name} was successfully destroyed."
  end

  private

  def set_resource
    @resource = resource_class.find(params[:id])
  end

  def resource_class
    "LookupTables::#{controller_name.classify}".constantize
  end

  def resource_params
    Rails.logger.debug("Parameters received: #{params.inspect}")
    params.require(resource_class.name.underscore.to_sym).permit(:name, :description, :comments, :source)
  end
end
