require 'spec_helper.rb'

describe ContactsController, type: :controller do
  it "get contact" do
    get 'contact'
    expect(response).to render_template(:contact)
  end

  it "post create" do
    post :create, :params => { 'first-name': "John", 'last-name': "Doe", 'message': "Hii I am John Doe", 'phone': "9478474787", 'email': "test@gmail.com" }
    expect(response.content_type).to eq "text/html; charset=utf-8"
  end
end