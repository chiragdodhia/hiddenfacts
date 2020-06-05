class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :sender_email, presence: true
  validates :message, presence: true
end
