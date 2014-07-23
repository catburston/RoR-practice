class VisitsController < ApplicationController
  def index
    @location = Location.find(params[:location_id])
    @visits = @location.visits
    render 'not_found', status:404 unless @visits
  end

  def show
    @visit = Visit.find_by(id: params[:location_id])
    render 'not_found', status:404 unless @visit
  end

  def new
    @location = Location.find(params[:location_id])
    @visit = Visit.new
    render 'new'
  end

  def visit_params
    params.require(:visit).permit(:user_name, :from_date, :to_date)
  end

  def create
    @location = Location.find(params[:location_id])
    @visit = @location.visits.new visit_params
    if @visit.save
      redirect_to action: 'index', controller: 'visits', location_id: @location.id
    else
      render 'new'
    end
  end
end
