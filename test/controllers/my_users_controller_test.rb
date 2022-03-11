require "test_helper"

class MyUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_users_path
    assert_response :success
  end
end
