class MyProduct < ApplicationRecord
    belongs_to :my_user
    has_many :my_orders, dependent: :destroy
    validates_presence_of :title, :description, :price
    validates :price, numericality: true, unless: Proc.new { |a| a.price.blank? }
end
