class Admin::StatesController < Admin::ApplicationController
  before_action :set_state, only: %i[show edit update destroy]

  # GET /states
  def index
    authorize State
    @states = policy_scope(State.order(:name))
  end

  # GET /states/1
  def show
    authorize @state
  end

  # GET /states/new
  def new
    @state = State.new
    authorize @state
  end

  # POST /states
  def create
    @state = State.new(state_params)
    authorize @state
    if @state.save
      redirect_to admin_state_path(@state), notice: "State was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /states/1/edit
  def edit
    authorize @state
  end

  # PATCH/PUT /states/1
  def update
    authorize @state
    if @state.update(state_params)
      redirect_to admin_state_path(@state), notice: "State was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /states/1
  def destroy
    authorize @state
    @state.destroy!
    redirect_to admin_states_path, notice: "State was successfully destroyed."
  end

  private

  def set_state
    @state = State.find(params.expect(:id))
  end

  def state_params
    params.expect(state: [:name, :description, :comments, :source])
  end
end
