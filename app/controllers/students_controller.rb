class StudentsController < ApplicationController
  def index
    @students = Student.paginate(page: params[:page], per_page: 5)
  end
end
