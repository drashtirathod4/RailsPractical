class FacultiesController < ApplicationController
  def index
    @faculties = Faculty.all()
  end

  def show
    @faculty = Faculty.find(params[:id])
  end

  def new
    @faculty = Faculty.new
  end

  def create
    faculty = Faculty.create(faculty_params)
    if faculty.valid?
      redirect_to faculties_path
    else 
      flash[:errors] = faculty.errors.full_messages
      redirect_to new_faculty_path
    end
  end

  def edit
    @faculty = Faculty.find(params[:id])
  end

  def update 
    @faculty = Faculty.find(params[:id])
    @faculty.update(faculty_params)
    if @faculty.valid?
      redirect_to faculty_path
    else 
      flash[:errors] = @faculty.errors.full_messages
      redirect_to edit_faculty_path(@faculty)
    end
  end

  def destroy
    @faculty = Faculty.find(params[:id])
    @faculty.destroy
    redirect_to faculties_path
  end

  private 
  def faculty_params
    params.require(:faculty).permit(:first_name, :last_name, :phone, :email, :dob, :designation)
  end
end
