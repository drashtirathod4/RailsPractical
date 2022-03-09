require "test_helper"

class MyUsersControllerTest < ActionDispatch::IntegrationTest
  # test "should get index" do
  #   get my_users_index_url
  #   assert_response :success
  # end

  # def setup
  #   @user = MyUser.new(email: "abc@mail.com", password: "abc123")
  # end

  test "should get index" do
    get my_users_path
    assert_response :success
  end
end
