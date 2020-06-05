json.extract! contact, :id, :first_name, :last_name, :sender_email, :receiver_email, :mobile_no, :message, :created_at, :updated_at
json.url contact_url(contact, format: :json)
