class StudentsController < ApplicationController
  def index
    @students = Student.paginate(page: params[:page], per_page: Student::DEFAULT_PER_PAGE)
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])

    if @student.update_attributes(params[:student])
      redirect_to(@student)
    else
      render :action => "edit"
    end
  end
end
