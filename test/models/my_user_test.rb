require "test_helper"

class MyUserTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should report error" do
    # some_undefined_variable is not defined elsewhere in the test case
    assert_raises(NameError) do
      some_undefined_variable
    end
  end

  def setup
    @user = MyUser.new(email: "abc@mail.com", password: "abc12345", role: "Admin")
  end

  test "should save user" do
    assert @user.save
  end

  test "should be valid" do
    assert @user.valid?
    puts "Valid"
  end

  test "shouldn't save without email" do
    # @user.email = nil
    assert @user.save
  end

  test "shouldn't save without password" do
    # @user.password = nil
    assert @user.save
  end

  test "shouldn't save without role" do
    # @user.role = nil
    assert @user.save
  end

  test "should be unique" do
    @user.save
    @my_user = MyUser.new(email: "abc@gmail.com", password: "abc123455", role: "Merchant")
    assert @my_user.valid?
  end
end
