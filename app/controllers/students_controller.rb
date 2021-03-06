class StudentsController < ApplicationController
  before_filter :load_student, except: [:index]

  def index
    @students = Student.includes(:title).paginate(page: params[:page], per_page: DEFAULT_PER_PAGE).decorate
  end

  def show
  end

  def edit
  end

  def update
    if @student.update_attributes(params[:student])
      redirect_to(@student)
    else
      render action: :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to students_url
  end

  private

  def load_student
    @student = Student.find(params[:id]).decorate
  end
end
