class ContactMailer < ApplicationMailer
  def send_message(msg)
    @msg = msg
    mail(from: "Contact Message <#{msg.sender_email}>", to: ENV['ADMIN_EMAIL'], subject: "New Message from #{msg.first_name}")
  end
end