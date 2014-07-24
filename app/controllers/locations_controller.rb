class LocationsController < ApplicationController
  def index
    @locations = Location.last_created(10)
    render 'not_found', status:404 unless @locations
  end

  def show
    @location = Location.find_by(id: params[:id])
    render 'not_found', status:404 unless @location
  end

  def new
    @location = Location.new
    render 'new'
  end

  def create
    @location = Location.new location_params
    #@visit.user = User.find(session[:user_id])

    if @location.save
      flash[:notice] = "Location created"
      redirect_to action: 'index', controller: 'locations'
    else
      render 'new'
    end
  end

  def destroy
    @location = Location.find(params[:id])
    @location.destroy
    flash[:notice] = "Location deleted"
    redirect_to action: 'index'
  end

  def update
    @location = Location.find(params[:id])

    if @location.update_attributes location_params
      flash[:notice] = "Location updated"
      redirect_to action: 'show', controller: 'locations', id: @location.id
    else
      flash[:error] = "Location not updated"
      @errors = location.errors.full_messages
      render 'edit'
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  private
    def location_params
      params.require(:location).permit(:name, :city, :country, :zip_code, :description)
    end
end