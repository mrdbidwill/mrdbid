# app/controllers/admin/source_data_controller.rb
class Admin::SourceDataController < Admin::BaseController
  before_action :set_source_data, only: [:edit, :update, :destroy]

  def index
    @source_data = SourceData.all
  end

  def new
    @source_data = SourceData.new
  end

  def create
    @source_data = SourceData.new(source_data_params)
    if @source_data.save
      redirect_to admin_source_data_path, notice: "Source data added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @source_data.update(source_data_params)
      redirect_to admin_source_data_path, notice: "Source data updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @source_data.destroy
    redirect_to admin_source_data_path, notice: "Source data deleted."
  end

  private

  def set_source_data
    @source_data = SourceData.find(params[:id])
  end

  def source_data_params
    params.require(:source_data).permit(:title, :author, :ref, :item_code, :source_data_type_id, :comments)
  end
end