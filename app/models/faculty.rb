class Faculty < ApplicationRecord
    validates_presence_of :first_name, :last_name, :phone, :email, :dob, :designation
    validates :phone, numericality: true, length: { is: 10 }, unless: Proc.new { |a| a.phone.blank? }
    validates :email, uniqueness: true
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, unless: Proc.new { |a| a.email.blank? }
    validate :dob_cannot_be_in_the_future
    validates :designation, inclusion: {in: %w{Ass.Prof. Prof.}, message: " can't be the value %{value} inserted!"}, unless: Proc.new { |a| a.designation.blank? }

    def dob_cannot_be_in_the_future
        if dob.present? && dob > Date.today
          errors.add(:dob, "Birthdate can't be in future!")
        end
    end
end
