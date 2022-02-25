class Product < ApplicationRecord
    has_many :orders, dependent: :destroy
    validates :title, :description, :price, :capacity, :status, presence: true
    validates :price, numericality: true, unless: Proc.new { |a| a.price.blank? }
    before_save :is_active_check, unless: :is_active?
    
    private
    def is_active_check
        self.is_active = false
    end

    default_scope { where("is_active = ?", true) }
    enum status: ["In stock", "Out of stock", "Coming soon"]
end
