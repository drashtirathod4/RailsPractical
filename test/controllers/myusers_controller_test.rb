require "test_helper"

class MyusersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get myusers_index_url
    assert_response :success
  end

  test "should get show" do
    get myusers_show_url
    assert_response :success
  end

  test "should get new" do
    get myusers_new_url
    assert_response :success
  end

  test "should get edit" do
    get myusers_edit_url
    assert_response :success
  end
end
