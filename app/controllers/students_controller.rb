class StudentsController < ApplicationController
  before_filter :load_student, :except => [:index]

  def index
    @students = Student.paginate(page: params[:page], per_page: Student::DEFAULT_PER_PAGE)
  end

  def show
  end

  def edit
  end

  def update
    if @student.update_attributes(params[:student])
      redirect_to(@student)
    else
      render :action => "edit"
    end
  end

  private

  def load_student
    @student = Student.find(params[:id])
  end
end
