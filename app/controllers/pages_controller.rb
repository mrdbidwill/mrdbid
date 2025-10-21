class PagesController < ApplicationController
  skip_before_action :authenticate_user!, raise: false
  skip_after_action :verify_authorized, raise: false

  def home
  end

  def contact
  end

  def trees_of_blakeley_signs
  end
end
