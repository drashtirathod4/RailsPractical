class Book < ApplicationRecord
    validates :name, :price, presence: true
    belongs_to :author
    has_many :images, :as => :imageable
end
