class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end

module DobValidation
  def dob_cannot_be_in_the_future
    if dob.present? && dob > Date.today
      errors.add(:dob, "Birthdate can't be in future!")
    end
  end
end 
