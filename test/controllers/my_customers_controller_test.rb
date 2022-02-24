require "test_helper"

class MyCustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_customers_index_url
    assert_response :success
  end

  test "should get show" do
    get my_customers_show_url
    assert_response :success
  end

  test "should get new" do
    get my_customers_new_url
    assert_response :success
  end

  test "should get edit" do
    get my_customers_edit_url
    assert_response :success
  end
end
