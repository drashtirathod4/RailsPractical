class Student < ApplicationRecord
    validates_presence_of :first_name, :last_name, :dob, :department
    validate :dob_cannot_be_in_the_future
    validates :department, inclusion: {in: %w{IT CE}, message: " can't be the value %{value} inserted!"}, unless: Proc.new { |a| a.department.blank? }
    validates :terms_of_usage, acceptance: {message: ": You cannot proceed without accepting Terms of Usage!" }, allow_nil: false 

    def dob_cannot_be_in_the_future
        if dob.present? && dob > Date.today
          errors.add(:dob, "Birthdate can't be in future!")
        end
    end
end
