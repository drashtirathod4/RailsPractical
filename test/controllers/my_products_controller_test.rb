require "test_helper"

class MyProductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_products_index_url
    assert_response :success
  end

  test "should get show" do
    get my_products_show_url
    assert_response :success
  end

  test "should get new" do
    get my_products_new_url
    assert_response :success
  end

  test "should get edit" do
    get my_products_edit_url
    assert_response :success
  end
end
