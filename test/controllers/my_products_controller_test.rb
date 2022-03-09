require "test_helper"

class MyProductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do 
    get '/my_users/sign_in'
    sign_in my_users(:my_users_001)
    post my_user_session_url
  end

  test "should get index" do
    get my_products_url
    assert_response :success
    puts "Index page loaded"
  end

  def setup
    @user = my_users(:my_users_001)
    @user.save
    @product = @user.my_products.create(title: "abc", description: "abc desc", price: "600")
    @product.save
  end

  test "should get show" do
    get my_product_path(@product.id)
    assert_response :success
  end

  test "should get new" do
    get new_my_product_path
    assert_response :success
  end

  test "should get edit" do
    get edit_my_product_path(@product.id)
    assert_response :success
  end
end
