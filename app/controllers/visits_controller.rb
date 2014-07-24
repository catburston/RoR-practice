class VisitsController < ApplicationController
  def index
    @location = Location.find(params[:location_id])
    @visits = @location.visits
    render 'not_found', status:404 unless @visits
  end

  def show
    @location = Location.find(params[:location_id])
    @visit = Visit.find(params[:id])
    render 'not_found', status:404 unless @visit
  end

  def new
    @location = Location.find(params[:location_id])
    @visit = Visit.new
    render 'new'
  end

  def create
    @location = Location.find(params[:location_id])
    @visit = @location.visits.new visit_params
    #@visit.user = User.find(session[:user_id])

    if @visit.save
      flash[:notice] = "Visit created"
      redirect_to action: 'index', controller: 'visits', location_id: @location.id
    else
      render 'new'
    end
  end

  def destroy
    @location = Location.find(params[:location_id])
    @visit = Visit.find(params[:id])
    @visit.destroy
    flash[:notice] = "Visit deleted"
    redirect_to action: 'index', controller: 'visits', location_id: @location.id
  end

  def update
    @location = Location.find(params[:location_id])
    @visit = @location.visits.find(params[:id])

    if @visit.update_attributes visit_params
      flash[:notice] = "Visit updated"
      redirect_to action: 'index', controller: 'visits', location_id: @location.id
    else
      flash[:error] = "Visit not updated"
      @errors = visit.errors.full_messages
      render 'edit'
    end
  end

  def edit
    @location = Location.find(params[:location_id])
    @visit = Visit.find(params[:id])
  end

  private
    def visit_params
      params.require(:visit).permit(:user_id, :user_name, :from_date, :to_date)
    end
end
