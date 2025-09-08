class Admin::SourceDataController < Admin::ApplicationController
  before_action :set_source_data, only: %i[show edit update destroy]

  # GET /source_datas
  def index
    authorize SourceData
    @source_data = policy_scope(
      SourceData
        .includes(:source_data_type).order("title") # eager load to satisfy strict_loading
    ).page(params[:page]).per(10)
  end


  # GET /source_datas/1
  def show
    authorize @source_data
  end

  # GET /source_datas/new
  def new
    @source_data = SourceData.new
    authorize @source_data
  end

  # POST /source_datas
  def create
    @source_data = SourceData.new(source_data_params)
    authorize @source_data
    if @source_data.save
      redirect_to admin_source_data_path(@source_data), notice: "Source data was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /source_datas/1/edit
  def edit
    authorize @source_data
  end

  # PATCH/PUT /source_datas/1
  def update
    authorize @source_data
    if @source_data.update(source_data_params)
      redirect_to admin_source_data_path(@source_data), notice: "Source data was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /source_datas/1
  def destroy
    authorize @source_data
    @source_data.destroy!
    redirect_to admin_source_data_path, notice: "Source data was successfully destroyed."
  end

  private

  def set_source_data
    @source_data = SourceData.includes(:source_data_type).find(params.expect(:id))
  end


  def source_data_params
    params.expect(source_data: [:title, :author, :ref, :item_code, :source_data_type_id, :comments])
  end
end
