class Address < ApplicationRecord
    belongs_to :addressable, polymorphic: :true
    validates :address, presence: :true
end
