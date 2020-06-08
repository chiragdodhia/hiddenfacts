class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  around_action :switch_locale

  def index
    @contacts = Contact.all
  end

  def show
  end

  def new
    @contact = Contact.new
  end

  def edit
  end

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

  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @contact, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.permit('first-name', 'last-name', 'email', 'phone', 'message')
    end
end
