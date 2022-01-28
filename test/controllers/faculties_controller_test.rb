require "test_helper"

class FacultiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get faculties_index_url
    assert_response :success
  end

  test "should get show" do
    get faculties_show_url
    assert_response :success
  end

  test "should get new" do
    get faculties_new_url
    assert_response :success
  end

  test "should get edit" do
    get faculties_edit_url
    assert_response :success
  end
end
