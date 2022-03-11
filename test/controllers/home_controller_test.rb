require "test_helper"

class HomeControllerTest < ActionDispatch::IntegrationTest

  test "should get welcome page" do
    get '/'
    assert_response :success
  end
end
