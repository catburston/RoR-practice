class LocationsController < ApplicationController
  def index
    #@locations = Location.order(created_at: :desc).limit(10)
    @locations = Location.last_created_scope(10)
  end
end
