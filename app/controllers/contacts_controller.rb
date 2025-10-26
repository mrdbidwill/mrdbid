# File: app/controllers/contacts_controller.rb
class ContactsController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized, raise: false

  def new
  end

  def create
    name = params[:name].to_s.strip
    email = params[:email].to_s.strip
    message = params[:message].to_s

    if name.blank? || email.blank? || message.blank?
      flash[:alert] = "Please provide your name, email, and a message."
      return redirect_to contact_path
    end

    begin
      ContactMailer.contact_message(name:, email:, message:).deliver_now
      flash[:notice] = "Thanks! Your message has been sent."
    rescue => e
      Rails.logger.error("Contact mail failed: #{e.class} - #{e.message}")
      flash[:alert] = "Sorry, we could not send your message. Please try again later."
    end

    redirect_to contact_path
  end
end