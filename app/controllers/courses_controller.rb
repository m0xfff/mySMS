class CoursesController < ApplicationController
  def index
    @courses = Course.paginate(page: params[:page], per_page: Course::DEFAULT_PER_PAGE).decorate
  end
end
