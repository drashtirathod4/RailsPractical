class Author < ApplicationRecord
    validates :fname, :lname, presence: true
    validates :email, presence: true
    has_many :books, dependent: :destroy
    has_many :images, :as => :imageable
end
