# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview
  def send_message
    ContactMailer.send_message(Contact.last)
  end
end
