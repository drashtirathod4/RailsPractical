class Myuser < ApplicationRecord
    validates_presence_of :first_name, :last_name, :email
    validates :email, uniqueness: true
    validates :password, confirmation: true, on: :create
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, unless: Proc.new { |a| a.email.blank? }
    validate :authenticate, on: :update
    
    # To authenticate password
    def authenticate
        u = Myuser.find_by_id(self.id)
        if self.email != u.email and self.password != u.password
            errors.add(:base, "Password is incorrect.")
        else 
            self.password = u.password
        end
    end

    # Merge first_name and last_name of user
    def full_name 
        self.first_name + " " + self.last_name
    end
end
