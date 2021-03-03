class InstitutesController < ApplicationController
  before_filter :load_institute, except: [:index, :show]

  def index
    @institutes = Institute.paginate(page: params[:page], per_page: DEFAULT_PER_PAGE)
  end

  def show
    @institute = Institute.includes(:courses).find(params[:id])
  end

  def edit
  end

  def update
    if @institute.update_attributes(params[:institute])
      redirect_to(@institute)
    else
      render action: :edit
    end
  end

  private

  def load_institute
    @institute = Institute.find(params[:id])
  end
end
