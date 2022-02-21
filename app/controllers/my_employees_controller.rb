class MyEmployeesController < ApplicationController
  def index
    @employees = MyEmployee.all
  end

  def show
    @employee = MyEmployee.find(params[:id])
  end

  def new
    @employee = MyEmployee.new
    1.times { @employee.emp_addresses.build }
  end

  def create
    employee = MyEmployee.create(employee_params)
    if employee.valid?
      redirect_to my_employees_path
    else 
      flash[:errors] = employee.errors.full_messages
      redirect_to new_my_employee_path
    end
  end

  def edit
    @employee = MyEmployee.find(params[:id])
  end

  def update 
    @employee = MyEmployee.find(params[:id])
    @employee.update(employee_params)
    if @employee.valid?
      redirect_to my_employees_path
    else 
      flash[:errors] = @employee.errors.full_messages
      redirect_to edit_my_employee_path(@employee)
    end
  end

  def destroy
    @employee = MyEmployee.find(params[:id])
    @employee.destroy
    redirect_to my_employees_path
  end

  # /search : to search employee by name
  def search
    @employees = MyEmployee.search(params[:search])
  end

  private 
  def employee_params
    params.require(:my_employee).permit(:employee_name, :email, :password, :gender, {hobbies:[]}, :address, :mobile_number, :birth_date, :document, emp_addresses_attributes: [:house_name, :street_name, :road])
  end
end
