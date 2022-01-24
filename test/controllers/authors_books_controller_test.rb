require "test_helper"

class AuthorsBooksControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get authors_books_show_url
    assert_response :success
  end
end
