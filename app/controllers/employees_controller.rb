class EmployeesController < ApplicationController
  def index
    @employees = Employee.search(params[:search])
  end

  def show
    @employee = Employee.find(params[:id])
  end

  def new
    @employee = Employee.new
  end

  def create
    employee = Employee.find_or_create_by(employee_params)
    if employee.valid?
      redirect_to employees_path
    else 
      flash[:errors] = employee.errors.full_messages
      redirect_to new_employee_path
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update 
    @employee = Employee.find(params[:id])
    @employee.update(employee_params)
    if @employee.valid?
      redirect_to employee_path
    else 
      flash[:errors] = @employee.errors.full_messages
      redirect_to edit_employee_path(@employee)
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy
    redirect_to employees_path
  end

  # Path of list page : employee/list
  def list
    @employee = Employee.all
  end
   
  def search_by_order
    @employees = Employee.order_search(params[:order_search])
  end

  private 
  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :age, :no_of_order, :full_time_available, :salary, :search)
  end
end
