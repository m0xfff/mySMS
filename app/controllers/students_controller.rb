class StudentsController < ApplicationController
  def index
    @students = Student.paginate(page: params[:page], per_page: Student::DEFAULT_PER_PAGE)
  end
end
