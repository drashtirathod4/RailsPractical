require "test_helper"

class MyOrdersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_orders_index_url
    assert_response :success
  end

  test "should get show" do
    get my_orders_show_url
    assert_response :success
  end

  test "should get new" do
    get my_orders_new_url
    assert_response :success
  end

  test "should get edit" do
    get my_orders_edit_url
    assert_response :success
  end
end
