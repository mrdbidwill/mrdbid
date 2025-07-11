# frozen_string_literal: true

class MushroomsController < ApplicationController
  before_action :set_mushroom, only: %i[show edit update destroy]
  before_action :authorize_mushroom, only: %i[edit update destroy]

  # GET /mushrooms or /mushrooms.json
  def index
    # Users can only see their own mushrooms
    @mushrooms = current_user.mushrooms
  end

  # GET /mushrooms/1 or /mushrooms/1.json
  def show; end

  # GET /mushrooms/new
  def new
    @mushroom = Mushroom.new
  end

  # GET /mushrooms/1/edit
  def edit; end

  # POST /mushrooms or /mushrooms.json
  def create
    # Automatically associate the mushroom with the signed-in user
    @mushroom = current_user.mushrooms.build(mushroom_params)


    respond_to do |format|
      if @mushroom.save
        format.html { redirect_to @mushroom, notice: 'Mushroom was successfully created.' }
        format.json { render :show, status: :created, location: @mushroom }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mushroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mushrooms/1 or /mushrooms/1.json
  def update
    respond_to do |format|
      if @mushroom.update(mushroom_params)
        format.html { redirect_to @mushroom, notice: 'Mushroom was successfully updated.' }
        format.json { render :show, status: :ok, location: @mushroom }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mushroom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mushrooms/1 or /mushrooms/1.json
  def destroy
    @mushroom.destroy!

    respond_to do |format|
      format.html { redirect_to mushrooms_path, status: :see_other, notice: 'Mushroom was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mushroom
    # Ensure the mushroom belongs to the current user
    @mushroom = current_user.mushrooms.find_by(id: params[:id])
    redirect_to mushrooms_path, alert: "Mushroom not found or not authorized." unless @mushroom
  end

  def authorize_mushroom
    # Ensures a user can edit, update, or destroy only their mushrooms
    redirect_to mushrooms_path, alert: "Not authorized to perform this action." unless @mushroom.user == current_user
  end

  # Only allow a list of trusted parameters through.
  def mushroom_params
    params.require(:mushroom).permit(:name, :description, :comment)
  end
end
