class ContactMailer < ApplicationMailer
  def contact_message(name:, email:, message:)
    @name = name
    @email = email
    @message = message

    mail(
      to: ENV.fetch("CONTACT_RECIPIENT", "contact@mrdbid.com"),
      reply_to: email,
      subject: "New contact form message from #{@name}"
    )
  end
end