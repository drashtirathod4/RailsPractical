class MyEmployee < ApplicationRecord
    has_many :emp_addresses, dependent: :destroy
    accepts_nested_attributes_for :emp_addresses, allow_destroy: true

    validates_presence_of :employee_name, :email, :password, :birth_date, :gender, :hobbies, :address, :mobile_number, :document
    validates :email, uniqueness: true
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, unless: Proc.new { |a| a.email.blank? }
    validate :dob_cannot_be_in_the_future
    validates :mobile_number, numericality: true, length: { is: 10 }, unless: Proc.new { |a| a.mobile_number.blank? }
    has_one_attached :document

    def dob_cannot_be_in_the_future
        if birth_date.present? && birth_date > Date.today
            errors.add(:birth_date, "Birthdate can't be in future!")
        end
    end

    # For search employees by name
    def self.search(query)
        if query
            employee = MyEmployee.find_by(employee_name: query.titleize)
            if employee
                MyEmployee.where(employee_name: employee.employee_name)
            else
                MyEmployee.all
            end
        else
            MyEmployee.all
        end
    end
end
