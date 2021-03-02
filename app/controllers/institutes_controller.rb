class InstitutesController < ApplicationController
  def index
    @institutes = Institute.paginate(page: params[:page], per_page: DEFAULT_PER_PAGE)
  end
end
