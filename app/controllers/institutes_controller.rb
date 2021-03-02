class InstitutesController < ApplicationController
  before_filter :load_institute, except: [:index]

  def index
    @institutes = Institute.paginate(page: params[:page], per_page: DEFAULT_PER_PAGE)
  end

  def show
  end

  private

  def load_institute
    @institute = Institute.find(params[:id])
  end
end
