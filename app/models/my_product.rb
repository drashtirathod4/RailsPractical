class MyProduct < ApplicationRecord
    has_many :my_orders, dependent: :destroy
end
