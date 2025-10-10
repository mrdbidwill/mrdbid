class ContactMailer < ApplicationMailer
  def contact_message(name:, email:, message:, recipient: "contact@mrdbid.com")
    @name = name
    @email = email
    @message = message

    mail(
      to: recipient,
      reply_to: email,
      subject: "New contact form message from #{@name}"
    )
  end
end