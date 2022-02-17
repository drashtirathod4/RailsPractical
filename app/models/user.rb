class User < ApplicationRecord
    has_secure_password
    has_many :events, dependent: :destroy
    has_one :address, as: :addressable
    has_many :comments, as: :commentable
    has_many :registers

    validates_presence_of :fname, :lname, :email, :phone, :password
    validates :email, uniqueness: true
    validates :password, confirmation: true, length: { within: 6..15 }, on: :create, unless: Proc.new { |a| a.password.blank? }
    validates :password, confirmation: true, length: { within: 6..15 }, on: :update, unless: Proc.new { |a| a.password.blank? }
    validates :password_confirmation, presence: true
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, unless: Proc.new { |a| a.email.blank? }
    validates :phone, numericality: true, length: { is: 10 }, unless: Proc.new { |a| a.phone.blank? }

    def full_name 
        self.fname + " " + self.lname
    end
end
