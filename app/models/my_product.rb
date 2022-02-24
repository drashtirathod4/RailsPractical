class MyProduct < ApplicationRecord
    has_many :my_orders, dependent: :destroy
    validates_presence_of :title, :description, :price
    validates :price, numericality: true, unless: Proc.new { |a| a.price.blank? }
end
