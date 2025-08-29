class StatesController < ApplicationController
  # If this must work for signed-out visitors, uncomment:
  # skip_before_action :authenticate_user!, only: :index

  def index
    states = State.where(country_id: params[:country_id]).order(:name).select(:id, :name)
    respond_to do |format|
      format.json { render json: states }
      format.html { head :not_found }
    end
  end
end