class MyCustomer < ApplicationRecord
    validates :phone, numericality: true, length: { is: 10 }, unless: Proc.new { |a| a.phone.blank? }
    validates :email, uniqueness: true
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, unless: Proc.new { |a| a.email.blank? }

    # For search customers by name
    def self.search(search)
        if search
            customer = MyCustomer.find_by(name: search.titleize)
            if customer
                MyCustomer.where(name: customer.name)
            else
                MyCustomer.all
            end
        else
            MyCustomer.all
        end
    end
end
