class Location < ActiveRecord::Base
  # because we created the class Locations, this command is not necessary
  #set_table_name 'locations'
  def self.iron_find(i)
    Location.where(id:i).first
  end

  def self.last_created(x)
    Location.order(created_at: :desc).limit(x)
  end
end
