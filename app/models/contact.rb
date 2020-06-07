class Contact < ApplicationRecord
  validates :first_name, presence: {message: "first_name_error"}
  validates :last_name, presence: {message: "last_name_error"}
  validates :sender_email, presence: {message: "email_error"}
  validates :message, presence: {message: "message_error"}
end
