class VisitsController < ApplicationController
  def index
    @location = Location.find(params[:id])
    @visits = @location.visits
    render 'not_found', status:404 unless @visits
  end

  def show
    @visit = Visit.find_by(id: params[:id])
    render 'not_found', status:404 unless @visit
  end
end
