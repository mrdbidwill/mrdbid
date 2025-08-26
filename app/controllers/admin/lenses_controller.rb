class Admin::LensesController < Admin::ApplicationController
  def index
    @lenses = Lens.all
  end

  def show
    @lens = Lens.find(params[:id])
  end

  def new
    @lens = Lens.new
  end

  def create
    @lens = Lens.new(lens_params)
    if @lens.save
      redirect_to admin_lenses_path, notice: "Lens successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @lens = Lens.find(params[:id])
  end

  def update
    @lens = Lens.find(params[:id])
    if @lens.update(lens_params)
      redirect_to admin_lenses_path, notice: "Lens successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lens = Lens.find(params[:id])
    @lens.destroy
    redirect_to admin_lenses_path, notice: "Lens successfully deleted."
  end

  private

  def lens_params
    params.require(:lens).permit(:make, :model, :description, :comments)
  end
end