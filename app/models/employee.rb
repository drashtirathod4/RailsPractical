class Employee < ApplicationRecord
    validates_presence_of :first_name, :last_name, :email, :age, :no_of_order, :salary
    validates :email, uniqueness: true
    validates :salary, numericality: true, unless: Proc.new { |a| a.salary.blank? }
    validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, unless: Proc.new { |a| a.email.blank? }
    validates :no_of_order, numericality: true, unless: Proc.new { |a| a.no_of_order.blank? }
    validates :age, numericality: true, unless: Proc.new { |a| a.age.blank? }
    before_save :full_time_check, unless: :full_time_available?

    def full_name
        self.first_name + " " + self.last_name
    end
    
    private
    def full_time_check
        self.full_time_available = false
    end

    # For serach employees by email
    def self.search(search)
        if search
            employee = Employee.find_by(email: search)
            if employee
                Employee.where(id: employee.id)
            else
                Employee.all
            end
        else
            Employee.all
        end
    end

    # For serach employees by no of order
    def self.order_search(order_search)
        if order_search
            employee = Employee.where(no_of_order: order_search).find_in_batches(batch_size: 10) do |employees|
            e = employees
            return e
        end
        else
            Employee.all
        end
    end


    # Pessimistic Locking
    Employee.transaction do 
        employee = Employee.lock("For Update now wait!").find_by(first_name: "Drashti")
        employee.update(salary: '48000')
        employee.lock!
    end
end
