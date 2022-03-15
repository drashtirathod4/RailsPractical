class Myuser < ApplicationRecord
    validates_presence_of :first_name, :last_name, :email
    validates :email, uniqueness: true
    validates :password, confirmation: true, on: :create
    # validates :password, confirmation: true, length: { within: 6..15 }, on: :update
    # validates :password_confirmation, presence: true
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, unless: Proc.new { |a| a.email.blank? }
    validate :authenticate, on: :update
    
    def authenticate
        u = Myuser.find_by_id(self.id)
        if self.password != u.password
            errors.add(:base, "Password is incorrect.")
        end
    end

    def full_name 
        self.first_name + " " + self.last_name
    end
    
    after_save do
        unless subscription?
            self.subscription == false
        end
    end
end
