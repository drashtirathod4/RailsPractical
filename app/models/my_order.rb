class MyOrder < ApplicationRecord
    belongs_to :my_product
    validates_presence_of :quantity, :my_product_id
    validates :quantity,  inclusion: { in: 0..5 , message: "must be in range 0 to 5"}
    # before_save :count_total_price

    # private
    # def count_total_price
    #     self.total_price =  self.quantity * self.my_product.price
    # end
end
