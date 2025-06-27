# app/controllers/lookup_tables_controller.rb
class LookupTablesController < ApplicationController
  before_action :set_table_name
  before_action :set_resource_class
  before_action :set_resource, only: %i[show edit update destroy]

  def index
    @resources = @resource_class.all
    render "lookup_tables/index"
  end

  def show
    render "lookup_tables/show"
  end

  def new
    @resource = @resource_class.new
    render "lookup_tables/form"
  end

  def edit
    render "lookup_tables/form"
  end

  def create
    @resource = @resource_class.new(resource_params)
    if @resource.save
      redirect_to lookup_table_path, notice: "#{@resource_class.name} created successfully."
    else
      render "lookup_tables/form", status: :unprocessable_entity
    end
  end

  def update
    if @resource.update(resource_params)
      redirect_to lookup_table_path, notice: "#{@resource_class.name} updated successfully."
    else
      render "lookup_tables/form", status: :unprocessable_entity
    end
  end

  def destroy
    @resource.destroy
    redirect_to lookup_table_path, notice: "#{@resource_class.name} was deleted.", status: :see_other
  end

  private

  def set_table_name
    @table_name = params[:table_name]
    raise ActiveRecord::RecordNotFound unless LOOKUP_TABLES.include?(@table_name)
  end

  def set_resource_class
    @resource_class = "LookupTables::#{@table_name.singularize.camelize}".constantize
  end

  def set_resource
    @resource = @resource_class.find(params[:id])
  end

  def resource_params
    params.require(@table_name.singularize.to_sym).permit(:name, :description, :comments, :source)
  end

  def lookup_table_path
    polymorphic_path(@resource_class)
  end
end
