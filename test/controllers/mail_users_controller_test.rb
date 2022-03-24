require "test_helper"

class MailUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mail_users_index_url
    assert_response :success
  end

  test "should get show" do
    get mail_users_show_url
    assert_response :success
  end

  test "should get new" do
    get mail_users_new_url
    assert_response :success
  end

  test "should get edit" do
    get mail_users_edit_url
    assert_response :success
  end
end
