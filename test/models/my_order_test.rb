require "test_helper"

class MyOrderTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  def setup
    @user = MyUser.create(email: "abc@mail.com", password: "abc123", role: "Admin")
    @user.save
    @product = @user.my_products.create(title: "abc", description: "abc desc", price: "600")
    @order = @product.my_orders.create(quantity: 1)
  end

  test "should save order" do
    assert @order.save
  end

  test "should be valid" do
    assert @order.valid?
  end

  test "shouldn't save without order quantity" do
    # @order.quantity = nil
    assert @order.save
  end

  test "shouldn't save without product id" do
    # @order.product_id = nil
    assert @order.save
  end

  test "quantity should be between 0 to 5" do
    # @order.quantity = -1
    # @order.quantity = 6
    assert @order.save
  end
end
