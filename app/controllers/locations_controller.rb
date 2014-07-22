class LocationsController < ApplicationController
  def index
    #@locations = Location.order(created_at: :desc).limit(10)
    @locations = Location.last_created(10)
    render 'not_found', status:404 unless @locations
  end

  def show
    @location = Location.find_by(id: params[:id])
    render 'not_found', status:404 unless @location
    # can add rescue to ApplicationController as Loc Cont inherits
    #rescue ActiveREcord::RecordNotFound
  end
end
