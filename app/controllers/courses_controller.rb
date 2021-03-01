class CoursesController < ApplicationController
  before_filter :load_course, except: [:index]

  def index
    @courses = Course.paginate(page: params[:page], per_page: DEFAULT_PER_PAGE).decorate
  end

  def show
  end

  def edit
  end

  def update
    if @course.update_attributes(params[:course])
      redirect_to(@course)
    else
      render action: :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to courses_url
  end

  private

  def load_course
    @course = Course.find(params[:id]).decorate
  end
end
