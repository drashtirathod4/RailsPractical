class Order < ApplicationRecord
    belongs_to :product
    belongs_to :customer
    validates_presence_of :quantity, :status, :product_id, :customer_id
    validates :quantity,  inclusion: { in: 0..5 , message: "must be in range 0 to 5"}
    enum :status, [:booked, :cancelled]
    before_save :count_total_price

    private
    def count_total_price
        self.total_price =  self.quantity * self.product.price
    end

    # For seacrh order by product name
    def self.search(search)
        if search
            product = Product.find_by(title: search.capitalize)
            if product
                self.where(product_id: product)
            else
                Order.unscoped.all
            end
        else
            Order.unscoped.all
        end
    end

    # For seacrh order by status or for filtered data
    def self.status_search(status_search)
        if status_search
            order = Order.find_by(status: status_search.downcase)
            if order
                Order.where(status: order.status)
            else
                Order.unscoped.all
            end
        else
            Order.unscoped.all
        end
    end
end
