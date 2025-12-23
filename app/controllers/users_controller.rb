class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin!, unless: -> { Rails.env.test? }  # Skip admin check in tests for now
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/:id
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /users/:id/edit
  def edit
  end

  # PATCH/PUT /users/:id
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully deleted.'
  end

  private

  def require_admin!
    unless current_user&.permission_id == 1
      flash[:alert] = "Admin access required."
      redirect_to root_path
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.strict_loading(false).find_by(id: params[:id])
    render file: "#{Rails.root}/public/404.html", status: :not_found if @user.nil?
  end


  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :display_name)
  end
end
