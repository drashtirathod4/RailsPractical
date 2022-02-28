require "test_helper"

class MyUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_users_index_url
    assert_response :success
  end
end
