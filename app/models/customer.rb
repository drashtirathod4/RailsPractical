class Customer < ApplicationRecord
    has_many :orders, dependent: :destroy
    validates_presence_of :fname, :lname, :email, :phone
    validates :email, uniqueness: true
    validates :phone, numericality: true, length: { is: 10 }, unless: Proc.new { |a| a.phone.blank? }
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, unless: Proc.new { |a| a.email.blank? }
end
