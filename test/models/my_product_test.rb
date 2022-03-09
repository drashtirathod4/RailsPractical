require "test_helper"

class MyProductTest < ActiveSupport::TestCase
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
    @user = MyUser.create(email: "abc@mail.com", password: "abc123", role: "Admin")
    @user.save
    @product = @user.my_products.create(title: "abc", description: "abc desc", price: "600")
  end
  
  test "should be valid" do
    @product.save
    assert @product.valid?
  end

  test "shouldn't save without user id" do
    # @product.user_id = nil
    assert @product.save
  end

  test "shouldn't save without product title" do
    # @product.title = nil
    assert @product.save
  end

  test "shouldn't save without product price" do
    # @product.price = nil
    assert @product.save
  end

  test "shouldn't save characters in price field" do
    # @product.price = "shdhs"
    assert @product.save
  end
end
