require "test_helper"

class MyEmployeesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get my_employees_index_url
    assert_response :success
  end

  test "should get show" do
    get my_employees_show_url
    assert_response :success
  end

  test "should get new" do
    get my_employees_new_url
    assert_response :success
  end

  test "should get edit" do
    get my_employees_edit_url
    assert_response :success
  end
end
