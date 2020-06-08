class ContactsController < ApplicationController
  around_action :switch_locale

  def contact
    @locale = params[:locale]
  end

  def create
    @contact = Contact.new
    @contact.first_name = params['first-name']
    @contact.last_name = params['last-name']
    @contact.sender_email = params['email']
    @contact.receiver_email = ENV['ADMIN_EMAIL']
    @contact.mobile_no = params['phone']
    @contact.message = params['message']

    if @contact.save
      ContactMailer.send_message(@contact).deliver_later
      redirect_to contact_info_url(params['locale']), notice: 'sent_message'
    else
      render :contact, notice: 'error_message'
    end
  end

  def switch_locale(&action)
    redirect_to root_url(locale: params[:set_locale]) if params[:set_locale]
    locale = params[:locale] || I18n.default_locale
    I18n.with_locale(locale, &action)
  end
end
