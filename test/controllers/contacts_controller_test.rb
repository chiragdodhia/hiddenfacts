require 'test_helper'

class ContactsControllerTest < ActionDispatch::IntegrationTest
  test "should create contact" do
    post contacts_url, params: { 'first-name': "John", 'last-name': "Doe", 'message': "Hii I am John Doe", 'phone': "9478474787", email: "test@gmail.com" }
    assert_response :found
  end

  test "should show contact" do
    get contact_info_url
    assert_response :success
  end
end
