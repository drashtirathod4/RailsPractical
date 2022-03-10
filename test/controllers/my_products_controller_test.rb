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

  test "should create product" do
    assert_difference("MyProduct.count") do
      post my_products_path, params: {my_product: {title: "def", description: "descripionnnn", price: "600", my_user_id: @user.id}}
    end
    assert_redirected_to my_products_path
  end

  test "should delete product" do
    delete "/my_products/#{@product.id}"
    assert(MyProduct.find_by(title: "abc")).to be_nil
  end
end
